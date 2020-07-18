<template>
  <div class="encounter-panel">
    <span class="encounter-prefix">Encounter :</span>
    <select
      v-model="encounter_props.selectedEncounter"
      class="dropdown encounter-dropdown"
      @change="onChangeEncounter()"
    >
      <option
        v-for="(encounter, index) in encounter_props.encounters"
        :value="encounter.name"
        :key="index"
      >{{encounter.name}}</option>
    </select>
    <span>View of :</span>
    <select v-model="selectedPcView" class="dropdown pc-view-dropdown">
      <option v-for="(pcView, index) in pcViews" :value="pcView.name" :key="index">{{pcView.name}}</option>
    </select>
    <div class="dm-code-box">
      <span>DM Code:</span>
      <input type="password" v-model="dmCode" />
    </div>
  </div>
</template>

<script>
export default {
  name: "encoutner-panel",
  components: {},
  props: {
    encounter_props: {
      encounters: Array,
      selectedEncounter: String
    }
  },
  data: function() {
    return {
      pcViews: [
        {
          name: "NONjoshiii"
        },
        {
          name: "Garei"
        },
        {
          name: "Ken"
        },
        {
          name: "Zenrar"
        }
      ],
      selectedPcView: "Zenrar",
      dmCode: ""
    };
  },
  // methods: {
  //   setNewSelectedOption(selectedOption) {
  //     this.config.placeholder = selectedOption.value;
  //   }
  // },
  methods: {
    onChangeEncounter: function() {
      console.log("onChangeEncounter", this.encounter_props.selectedEncounter);
      this.$emit("select:encounter", this.encounter_props.selectedEncounter);
    }
  }
};
</script>

<style lang="scss" scoped>
.encounter-panel {
  display: flex;
  text-align: center;
  align-items: center;
  height: 100%;
  max-height: 6vh;

  span,
  .dropdown,
  .dm-code-box {
    align-items: stretch;

    vertical-align: middle;
    align-content: center;
    margin: 2px;
  }
  .dropdown {
    margin-right: 10px;
  }

  .dm-code-box {
    margin-left: auto;
    margin-right: 20px;

    input {
      max-width: 80px;
    }
  }
}
</style>