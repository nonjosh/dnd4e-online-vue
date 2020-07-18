<template>
  <iframe :id="url" :src="url"/>
</template>

<script>
export default {
  name: "i-frame",
  props: {
    url: String
  }
}
</script>

<style scoped>
iframe {
  width: 100%;
  height: 100%;
}
</style>