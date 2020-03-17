import Vue from "vue";
import Vuetify from "vuetify/lib";
import colors from "vuetify/lib/util/colors";

Vue.use(Vuetify);

export default new Vuetify({
  theme: {
    //dark: true,
    themes: {
      light: {
        primary: colors.grey.darken3,
        secondary: "#02789d",
        background: colors.shades.white
      },
      dark: {
        primary: colors.orange.darken2,
        background: colors.grey.darken4
      }
    }
  }
});
