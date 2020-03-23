import Vue from "vue";
import Vuetify from "vuetify/lib";
import colors from "vuetify/lib/util/colors";
import { getColor } from "../meta/colors";

Vue.use(Vuetify);

export default new Vuetify({
  theme: {
    //dark: true,
    themes: {
      light: {
        primary: colors.grey.darken3,
        secondary: colors.grey.lighten1,
        background: colors.shades.white,
        success: getColor(2),
        error: getColor(3),
        warning: getColor(1)
      },
      dark: {
        primary: colors.orange.darken2,
        background: colors.grey.darken4
      }
    }
  }
});
