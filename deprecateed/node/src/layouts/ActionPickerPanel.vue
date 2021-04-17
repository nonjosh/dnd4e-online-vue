<template>
  <div class="action-picker-panel">
    <div id="tabs" class="container">
      <div class="tabs">
        <a v-on:click="activetab=1" v-bind:class="[ activetab === 1 ? 'active' : '' ]">Initiative</a>
        <a v-on:click="activetab=2" v-bind:class="[ activetab === 2 ? 'active' : '' ]">Skills</a>
        <a v-on:click="activetab=3" v-bind:class="[ activetab === 3 ? 'active' : '' ]">Feats</a>
        <a v-on:click="activetab=4" v-bind:class="[ activetab === 4 ? 'active' : '' ]">Attack Powers</a>
        <a
          v-on:click="activetab=5"
          v-bind:class="[ activetab === 5 ? 'active' : '' ]"
        >Utility Powers</a>
        <a v-on:click="activetab=6" v-bind:class="[ activetab === 6 ? 'active' : '' ]">Items</a>
      </div>

      <div class="content">
        <div v-if="activetab === 1" class="tabcontent">Is this the real life? Is this just fantasy?</div>
        <div v-if="activetab === 2" class="tabcontent">Caught in a landslide, no escape from reality</div>
        <div v-if="activetab === 3" class="tabcontent">Open your eyes, look up to the skies and see</div>
        <div v-if="activetab === 4" class="tabcontent">
          <PowerCardVue
            v-for="(powerCard1, index1) in cards.attackPowerCards"
            :key="index1"
            :card_name="powerCard1.name"
          />
        </div>
        <div v-if="activetab === 5" class="tabcontent">
          <PowerCardVue
            v-for="(powerCard2, index2) in cards.utilityPowerCards"
            :key="index2"
            :card_name="powerCard2.name"
          />
        </div>
        <div v-if="activetab === 6" class="tabcontent">Open your eyes, look up to the skies and see</div>
      </div>
    </div>
  </div>
</template>

<script>
import PowerCardVue from "@/components/PowerCard.vue";

export default {
  // el: "#tabs",
  components: {
    PowerCardVue
  },
  data: function() {
    return {
      activetab: 4,
      cards: {
        initiativeCards: [{}],
        featCards: [{}, {}],
        attackPowerCards: [
          {
            name: "Ensorcelled Blade"
          },
          {
            name: "Burning Spray"
          },
          {
            name: "Dragon Breath"
          },
          {
            name: "Explosive Pyre"
          },
          {
            name: "Flame Spiral"
          },
          {
            name: "Lightning Breath"
          }
        ],
        utilityPowerCards: [
          {
            name: "Dragonflame Mantle"
          }
        ]
      }
    };
  }
};
</script>

<style scoped>
.action-picker-panel {
  height: 100%;
}

/* Import Google Font */
/* @import url(https://fonts.googleapis.com/css?family=Nunito+Sans); */
/* 
/* RESET */
/* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}
*/

/* STYLING */
.container {
  width: 49vw;
  height: 100%;
  /* max-width: 620px; */
  min-width: 450px;
  /* margin: 40px auto; */
  font-family: "Nunito Sans", Arial, Helvetica, sans-serif;
  color: #888;
  display: flex;
  flex-direction: column;
}

/* Style the tabs */
.tabs {
  overflow: hidden;
  margin-left: 20px;
  margin-bottom: -2px;
}

.tabs ul {
  list-style-type: none;
  margin-left: 20px;
}

.tabs a {
  float: left;
  cursor: pointer;
  padding: 12px 24px;
  transition: background-color 0.2s;
  border: 1px solid #ccc;
  border-right: none;
  background-color: #f1f1f1;
  border-radius: 10px 10px 0 0;
  font-weight: bold;
}
.tabs a:last-child {
  border-right: 1px solid #ccc;
}

/* Change background color of tabs on hover */
.tabs a:hover {
  background-color: #aaa;
  color: #fff;
}

/* Styling for active tab */
.tabs a.active {
  background-color: #fff;
  color: #484848;
  border-bottom: 2px solid #fff;
  cursor: default;
}

.content {  
  flex-grow: 1;
  /* flex-shrink: 0; */
  width: 100%;
  display: flex;
}

/* Style the tab content */
.tabcontent {
  /* flex-shrink: 0;
  flex-grow: 1; */
  padding: 30px;
  border: 1px solid #ccc;
  border-radius: 10px;
  box-shadow: 3px 3px 6px #e1e1e1;
  overflow: scroll;
  height: 400px;
  margin-right: 5px;
}
</style>