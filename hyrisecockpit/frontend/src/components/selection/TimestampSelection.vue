<template>
  <div>
    <div class="mb-2">{{ label }}</div>
    <v-menu
      v-model="datePicker"
      :close-on-content-click="false"
      :nudge-right="40"
      transition="scale-transition"
      offset-y
    >
      <template v-slot:activator="{ on }">
        <v-text-field v-model="date" label="Date" prepend-icon="mdi-calendar" readonly v-on="on"></v-text-field>
      </template>
      <v-date-picker v-model="date" color="primary" :allowed-dates="allowedDates"></v-date-picker>
    </v-menu>
    <v-menu
      v-model="timePicker"
      :close-on-content-click="false"
      :nudge-right="40"
      transition="scale-transition"
      offset-y
    >
      <template v-slot:activator="{ on }">
        <v-text-field v-model="time" label="Time" prepend-icon="mdi-clock" readonly v-on="on"></v-text-field>
      </template>
      <v-time-picker
        v-model="time"
        format="24hr"
        color="primary"
        :allowed-hours="allowedHours"
        :allowed-minutes="allowedMinutes"
      ></v-time-picker>
    </v-menu>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  Ref,
  ref,
  watch,
  computed,
} from "@vue/composition-api";
import { useFormatting } from "@/meta/formatting";

interface Data extends UseDatePicking, UseTimePicking {}

interface Props {
  label: string;
  minDate: string;
  minTime: string;
}

export default defineComponent({
  props: {
    label: {
      type: String,
      required: true,
    },
    minDate: {
      type: String,
      default: null,
    },
    minTime: {
      type: String,
      default: null,
    },
  },
  setup(props: Props, context: SetupContext): Data {
    const datePicking = useDatePicking(props, context);
    return {
      ...datePicking,
      ...useTimePicking(props, context, datePicking.date),
    };
  },
});

interface UseDatePicking {
  date: Ref<string>;
  datePicker: Ref<boolean>;
  allowedDates: (dateString: string) => boolean;
}

function useDatePicking(props: Props, context: SetupContext): UseDatePicking {
  const { subDays } = useFormatting();
  const date = ref("");
  const datePicker = ref(false);

  function allowedDates(dateString: string): boolean {
    const selectedDate = new Date(dateString);
    const currentDate = new Date();
    return (
      selectedDate.getTime() >=
        Math.max(
          subDays(currentDate, 7).getTime(),
          props.minDate ? new Date(props.minDate).getTime() : 0
        ) && selectedDate < currentDate
    );
  }

  // set date on change
  watch(
    () => props.minDate,
    () => {
      if (
        (props.minDate &&
          date.value !== "" &&
          new Date(date.value) < new Date(props.minDate)) ||
        (props.minDate && date.value === "")
      )
        date.value = props.minDate;
    }
  );

  /* emit new date */
  watch(date, () => handleDateChange());

  function handleDateChange(): void {
    datePicker.value = false;
    context.emit("dateChanged", date.value);
  }

  return { date, datePicker, allowedDates };
}

interface UseTimePicking {
  time: Ref<string>;
  timePicker: Ref<boolean>;
  allowedHours: Ref<readonly number[]>;
  allowedMinutes: Ref<readonly number[]>;
}

function useTimePicking(
  props: Props,
  context: SetupContext,
  selectedDate: Ref<string>
): UseTimePicking {
  const { subDays, formatDateWithoutTime } = useFormatting();

  const time = ref("");
  const timePicker = ref(false);
  const minimumTime = ref(props.minTime);

  const availableHours = [...Array(24).keys()];
  const availableMinutes = [...Array(12).keys()].map((key) => key * 5);

  const allowedHours = computed(() =>
    availableHours.filter(
      (hour) =>
        [null, ""].includes(minimumTime.value) ||
        new Date(selectedDate.value) > new Date(props.minDate) ||
        (!isInFuture(selectedDate.value, `${hour}:55`) &&
          !isInPast(minimumTime.value, `${hour}:55`))
    )
  );

  //TODO: show only values before current date
  const allowedMinutes = computed(() =>
    availableMinutes.filter(
      (minute) =>
        [null, ""].includes(minimumTime.value) ||
        (!isInFuture(
          selectedDate.value,
          `${time.value.split(":")[0]}:${minute}`
        ) &&
          !isInPast(minimumTime.value, `${time.value.split(":")[0]}:${minute}`))
    )
  );

  /* check if new time string is after current time */
  function isInFuture(dateString: string, newTimeString: string): boolean {
    const currentDate = formatDateWithoutTime(new Date());
    const currentTime = `${new Date().getHours()}:${new Date().getMinutes()}`;
    return (
      new Date(dateString) > currentDate ||
      (new Date(dateString) === currentDate &&
        !isInPast(currentTime, newTimeString))
    );
  }

  /* check if new time string is before base time sting */
  function isInPast(baseTimeString: string, newTimeString: string): boolean {
    const baseTimes = baseTimeString.split(":");
    const newTimes = newTimeString.split(":");

    return (
      parseInt(baseTimes[0], 10) > parseInt(newTimes[0], 10) ||
      (parseInt(baseTimes[0], 10) === parseInt(newTimes[0], 10) &&
        parseInt(baseTimes[1], 10) > parseInt(newTimes[1], 10))
    );
  }

  // set time on change
  watch(
    () => props.minTime,
    () => {
      if (
        (props.minTime &&
          time.value !== "" &&
          (new Date(selectedDate.value) === new Date(props.minDate) ||
            [selectedDate.value, props.minDate].includes("")) &&
          isInPast(props.minTime, minimumTime.value)) ||
        (props.minTime && time.value === "")
      ) {
        time.value = props.minTime;
        minimumTime.value = props.minTime;
      }
    }
  );

  /* emit new time */
  watch(time, () => handleTimeChange());

  function handleTimeChange(): void {
    timePicker.value = false;
    context.emit("timeChanged", time.value);
  }

  return { time, timePicker, allowedHours, allowedMinutes };
}
</script>
