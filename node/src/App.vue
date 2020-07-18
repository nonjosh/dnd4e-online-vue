<template>
  <div id="app">
    <div class="left-half">
      <i-frame :url="iFrameUrl" />
    </div>
    <div class="right-half">
      <div class="encounter-panel-border">
        <EncounterPanel :encounter_props="encounter_props" @select:encounter="changeEncounter" />
      </div>
      <div class="output-area-border">
        <div class="initiative-panel-border">
          <InitiativePanel />
        </div>
        <div class="action-log-panel-border">
          <ActionLogPanelVue />
        </div>
      </div>
      <div class="action-roller-panel-border">
        <ActionRollerPanelVue />
      </div>
      <div class="action-picker-panel-border">
        <ActionPickerPanelVue />
      </div>
    </div>
  </div>
</template>

<script>
import IFrame from "@/components/IFrame.vue";
import EncounterPanel from "@/layouts/EncounterPanel.vue";
import InitiativePanel from "@/layouts/InitiativePanel.vue";
import ActionLogPanelVue from "@/layouts/ActionLogPanel.vue";
import ActionRollerPanelVue from "@/layouts/ActionRollerPanel.vue";
import ActionPickerPanelVue from "@/layouts/ActionPickerPanel.vue";

export default {
  title: "my title",
  name: "app-test",
  components: {
    IFrame,
    EncounterPanel,
    InitiativePanel,
    ActionLogPanelVue,
    ActionRollerPanelVue,
    ActionPickerPanelVue
  },
  data() {
    return {
      encounter_props: {
        encounters: [
          {
            name: "M1",
            url:
              "https://docs.google.com/spreadsheets/d/1y5xgJf68waW8LUqcmgi03MfHsjztjqUlCN2RPGHzOQQ/edit#gid=672112745"
          },
          {
            name: "M2",
            url:
              "https://docs.google.com/spreadsheets/d/1y5xgJf68waW8LUqcmgi03MfHsjztjqUlCN2RPGHzOQQ/edit#gid=2103856553"
          },
          {
            name: "M3",
            url:
              "https://docs.google.com/spreadsheets/d/1y5xgJf68waW8LUqcmgi03MfHsjztjqUlCN2RPGHzOQQ/edit#gid=1994654549"
          },
          {
            name: "M4",
            url:
              "https://docs.google.com/spreadsheets/d/1y5xgJf68waW8LUqcmgi03MfHsjztjqUlCN2RPGHzOQQ/edit#gid=1204217673"
          },
          {
            name: "M5",
            url:
              "https://docs.google.com/spreadsheets/d/1y5xgJf68waW8LUqcmgi03MfHsjztjqUlCN2RPGHzOQQ/edit#gid=1698304832"
          },
          {
            name: "V1",
            url:
              "https://docs.google.com/spreadsheets/d/1y5xgJf68waW8LUqcmgi03MfHsjztjqUlCN2RPGHzOQQ/edit#gid=575036002"
          },
          {
            name: "V2",
            url:
              "https://docs.google.com/spreadsheets/d/1y5xgJf68waW8LUqcmgi03MfHsjztjqUlCN2RPGHzOQQ/edit#gid=591598018"
          },
          {
            name: "V3",
            url:
              "https://docs.google.com/spreadsheets/d/1y5xgJf68waW8LUqcmgi03MfHsjztjqUlCN2RPGHzOQQ/edit#gid=1119569518"
          },
          {
            name: "V4",
            url:
              "https://docs.google.com/spreadsheets/d/1y5xgJf68waW8LUqcmgi03MfHsjztjqUlCN2RPGHzOQQ/edit#gid=1402374403"
          },
          {
            name: "V5",
            url:
              "https://docs.google.com/spreadsheets/d/1y5xgJf68waW8LUqcmgi03MfHsjztjqUlCN2RPGHzOQQ/edit#gid=1577950553"
          },
          {
            name: "V6",
            url:
              "https://docs.google.com/spreadsheets/d/1y5xgJf68waW8LUqcmgi03MfHsjztjqUlCN2RPGHzOQQ/edit#gid=1311136344"
          }
        ],
        selectedEncounter: "M5"
      },
      iFrameUrl:
        "https://docs.google.com/spreadsheets/d/1y5xgJf68waW8LUqcmgi03MfHsjztjqUlCN2RPGHzOQQ/edit#gid=1698304832"
    };
  },
  methods: {
    changeEncounter() {
      this.encounter_props.encounters.forEach(element => {
        if (element.name == this.encounter_props.selectedEncounter) {
          console.log("Picked", element.name, element.url);
          this.iFrameUrl = element.url;
        }
      });
    }
  }
};
</script>

<style lang="scss" scoped>
.left-half {
  float: left;
  width: 50%;
  height: 100vh;
}
.right-half {
  float: right;
  width: 50%;
  height: 100vh;
  white-space: nowrap;
  display: flex;
  flex-direction: column;

  .encounter-panel-border {
    flex-shrink: 0;
    height: 4vh;
    border-bottom: black 1px solid;
  }

  .output-area-border {
    flex-shrink: 0;
    display: flex;
    max-height: 30vh;

    .initiative-panel-border {
      flex: 1 0 0px;
    }

    .action-log-panel-border {
      flex: 1 0 0px;
    }
  }

  .action-roller-panel-border {
    flex-shrink: 0;
    min-height: 15vh; 
    border-top: black solid 1px;
    /* border-bottom: black solid 1px; */
    overflow-y: scroll;
    margin: 0.5em;
  }

  .action-picker-panel-border {
    flex-shrink: 0;
    flex-grow: 1;
    overflow-y: scroll;
  }
}
</style>