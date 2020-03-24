import Vue from "vue";
import Vuetify from "vuetify/lib";
import colors from "vuetify/lib/util/colors";
import { colorDefinition } from "../meta/colors";

Vue.use(Vuetify);

export default new Vuetify({
  theme: {
    //dark: true,
    themes: {
      light: {
        primary: colors.grey.darken3,
        secondary: colors.grey.lighten1,
        background: colors.shades.white,
        success: colorDefinition.green,
        error: colorDefinition.red,
        warning: colorDefinition.orange
      },
      dark: {
        primary: colors.orange.darken2,
        background: colors.grey.darken4
      }
    }
  }
});
