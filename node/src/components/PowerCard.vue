<template>
  <div class="power-card">
    <div class="button">
      <button v-on:click="loadFile">Use (Remaining charge: 1)</button>
    </div>
    <div v-html="input"></div>
    <!-- {{html_content}} -->
    <!-- <iframe src="http://www.funin.space/compendium/power/Flame-Spiral.html" /> -->
    <div id="overlay"></div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  props: {
    card_name: String
  },
  data() {
    return {
      input: null,
      // card_name: "Conductive Defense",
      // card_url: "http://data.dnd.nonjosh.info/compendium/power/Flame-Spiral.html",
    };
  },
  created() {
    this.loadFile();
  },
  methods: {
    loadFile() {
      var url =
        "http://data.dnd.nonjosh.info/compendium/power/" + this.titleCase(this.card_name) + ".html";
      axios({
        method: "get",
        // url: this.card_url
        url: url
      }).then(result => {
        this.input = result.data;
        this.input = this.input.replace(
          /Charisma modifier/,
          "Charisma modifier (+5)"
        );
        // console.log("Data: " + result.data)
      });
      // .catch(error => {
      //   console.error("error getting file");
      // });
    },
    titleCase(str) {
      var wordsArray = str.toLowerCase().split(/\s+/);
      var upperCased = wordsArray.map(function(word) {
        return word.charAt(0).toUpperCase() + word.substr(1);
      });
      return upperCased.join("-");
    }
  },
  computed: {
    refresh: function() {
      this.loadFile();
      return null;
    }
  }
};
</script>

<style lang="scss">
@import "http://data.dnd.nonjosh.com/compendium/power/styles/detail.css";

div.power-card {
  // height: 600px;
  // width: 300px;
  white-space: normal;
  display: inline-block;
  // border: black solid 1px;
}

.button {
  text-align: center;
  margin: 5px;
}

div.power-card #detail {
  width: 300px;
}
#overlay {
  display: none;
  background-color: gray;
  opacity: 0.8;
}
</style>