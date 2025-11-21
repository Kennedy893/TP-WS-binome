<template>
  <div id="app">
    <h1>Gestion des Semestres</h1>

    <component
      :is="currentView"
      :semestreSelectionne="semestreSelectionne"
      :etudiantSelectionne="etudiantSelectionne"
      @voir-etudiants="ouvrirEtudiants"
      @voir-details="ouvrirDetailsEtudiant"
      @retour="retour"
    />
  </div>
</template>

<script>
import SemestreList from './SemestreList.vue'
import EtudiantList from './EtudiantList.vue'
import DetailsEtudiant from './DetailsEtudiant.vue'

export default {
  name: 'App',
  components: { SemestreList, EtudiantList, DetailsEtudiant },
  data() {
    return {
      currentView: 'SemestreList',
      semestreSelectionne: null,
      etudiantSelectionne: null
    }
  },
  methods: {
    ouvrirEtudiants(semestre) {
      this.semestreSelectionne = semestre
      this.etudiantSelectionne = null
      this.currentView = 'EtudiantList'
    },
    ouvrirDetailsEtudiant(etudiant) {
      this.etudiantSelectionne = etudiant
      this.currentView = 'DetailsEtudiant'
    },
    retour() {
      if (this.currentView === 'DetailsEtudiant') {
        // Retour à la liste des étudiants
        this.currentView = 'EtudiantList'
        this.etudiantSelectionne = null
      } else if (this.currentView === 'EtudiantList') {
        // Retour à la liste des semestres
        this.currentView = 'SemestreList'
        this.semestreSelectionne = null
      }
    }
  }
}
</script>

<style>
#app {
  max-width: 800px;
  margin: auto;
  padding: 20px;
  font-family: "Poppins", sans-serif;
}
</style>
