import Vue from "vue";
import Vuetify from "vuetify/lib";
import { colorValueDefinition } from "../meta/colors";

Vue.use(Vuetify);

export default new Vuetify({
  theme: {
    //dark: true,
    themes: {
      light: {
        primary: colorValueDefinition.darkgrey,
        secondary: colorValueDefinition.lightgrey,
        background: colorValueDefinition.white,
        success: colorValueDefinition.green,
        error: colorValueDefinition.red,
        warning: colorValueDefinition.orange,
      },
      dark: {
        primary: colorValueDefinition.orange,
        background: colorValueDefinition.darkgrey,
      },
    },
  },
});
