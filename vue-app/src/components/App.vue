<template>
  <div id="app">
    <h1>Gestion des Semestres</h1>

    <!-- Vue dynamique -->
    <component 
      :is="currentView" 
      :semestreSelectionne="semestreSelectionne"
      @voir-etudiants="ouvrirEtudiants"
      @retour="retourAccueil"
    />
  </div>
</template>

<script>
import SemestreList from './SemestreList.vue'
import EtudiantList from './EtudiantList.vue'

export default {
  name: 'App',
  components: { SemestreList, EtudiantList },
  data() {
    return {
      currentView: 'SemestreList',
      semestreSelectionne: null
    }
  },
  methods: {
    ouvrirEtudiants(semestre) {
      this.semestreSelectionne = semestre
      this.currentView = 'EtudiantList'
    },
    retourAccueil() {
      this.semestreSelectionne = null
      this.currentView = 'SemestreList'
    }
  }
}
</script>

<style>
body {
  font-family: "Poppins", sans-serif;
  background: #fafafa;
}
#app {
  max-width: 800px;
  margin: auto;
  padding: 20px;
}
</style>
