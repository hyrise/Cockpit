import Vue from "vue";
import Vuetify from "vuetify/lib";
import colors from "vuetify/lib/util/colors";
import { colorValueDefinition } from "../meta/colors";

Vue.use(Vuetify);

export default new Vuetify({
  theme: {
    //dark: true,
    themes: {
      light: {
        primary: colorValueDefinition.primary, //colors.grey.darken3,//#424242
        secondary: colorValueDefinition.secondary, //colors.grey.lighten1,//#BDBDBD
        background: colorValueDefinition.background, //colors.shades.white, //#FFFFFF
        success: colorValueDefinition.success,
        error: colorValueDefinition.error,
        warning: colorValueDefinition.warning
      },
      dark: {
        primary: colors.orange.darken2,
        background: colors.grey.darken4
      }
    }
  }
});
