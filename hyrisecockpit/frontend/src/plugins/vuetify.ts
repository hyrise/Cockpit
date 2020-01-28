import Vue from "vue";
import Vuetify from "vuetify/lib";
import colors from "vuetify/lib/util/colors";

Vue.use(Vuetify);

export default new Vuetify({
  theme: {
    dark: true,
    themes: {
      light: {
        background: colors.grey.darken2
      },
      dark: {
        primary: colors.cyan.darken3,
        background: colors.grey.darken4
      }
    }
  }
});
