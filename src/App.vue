<template>
  <v-app>
    <CharPanel />
  </v-app>
</template>

<script>
import CharPanel from "./layouts/CharPanel.vue";

export default {
  name: "App",

  components: {
    CharPanel,
  },

  data: () => ({
    //
  }),
};
</script>
