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
        <v-text-field
          v-model="date"
          label="Date"
          prepend-icon="mdi-calendar"
          readonly
          v-on="on"
        ></v-text-field>
      </template>
      <v-date-picker
        v-model="date"
        color="primary"
        :allowed-dates="allowedDates"
      ></v-date-picker>
    </v-menu>
    <v-menu
      v-model="timePicker"
      :close-on-content-click="false"
      :nudge-right="40"
      transition="scale-transition"
      offset-y
    >
      <template v-slot:activator="{ on }">
        <v-text-field
          v-model="time"
          label="Time"
          prepend-icon="mdi-clock"
          readonly
          v-on="on"
        ></v-text-field>
      </template>
      <v-time-picker
        v-model="time"
        format="24hr"
        color="primary"
        :min="minTime"
        :max="maxTime"
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
          new Date(date.value).getTime() < new Date(props.minDate).getTime()) ||
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
  maxTime: Ref<string>;
}

function useTimePicking(
  props: Props,
  context: SetupContext,
  selectedDate: Ref<string>
): UseTimePicking {
  const { subDays, formatDateWithoutTime } = useFormatting();

  const time = ref("");
  const timePicker = ref(false);
  const currentDate = ref<Date>(new Date());

  /* update current time manually every 1 min */
  const resetTime = setInterval(() => {
    currentDate.value = new Date();
  }, 1000 * 60);

  const maxTime = computed(() =>
    formatDateWithoutTime(new Date(selectedDate.value)).getTime() ===
    formatDateWithoutTime(currentDate.value).getTime()
      ? getTime(currentDate.value)
      : "23:59"
  );

  function getTime(date: Date): string {
    return `${new Date().getHours()}:${new Date().getMinutes()}`;
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
          (new Date(selectedDate.value).getTime() ===
            new Date(props.minDate).getTime() ||
            [selectedDate.value, props.minDate].includes("")) &&
          isInPast(props.minTime, time.value)) ||
        (props.minTime && time.value === "")
      ) {
        time.value = props.minTime;
      }
    }
  );

  /* emit new time */
  watch(time, () => handleTimeChange());

  function handleTimeChange(): void {
    timePicker.value = false;
    context.emit("timeChanged", time.value);
  }

  return {
    time,
    timePicker,
    maxTime,
  };
}
</script>
