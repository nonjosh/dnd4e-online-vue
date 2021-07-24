<template>
  <div id="app">
    <CharPanel />
  </div>
</template>

<script>
import CharPanel from "./layouts/CharPanel.vue";

export default {
  name: "App",
  components: {
    CharPanel,
  },
};
</script>

<style>
/* #app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
} */
</style>
