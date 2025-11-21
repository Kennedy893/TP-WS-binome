<!-- <template>
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
</template> -->

<script>
import SemestreList from './SemestreList.vue'
import EtudiantList from './EtudiantList.vue'
import DetailsEtudiant from './DetailsEtudiant.vue'
import Releve from './Releve.vue'
import InfosEtu from './InfosEtu.vue'

export default {
  // name: 'App',
  // components: { SemestreList, EtudiantList, DetailsEtudiant },


  name: 'App',
  components: { SemestreList, EtudiantList, Releve, InfosEtu, DetailsEtudiant },
  data() {
    return {
      currentView: 'SemestreList',
      semestreSelectionne: null,
      etudiantSelectionne: null,
      etudiant: null
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
    },
    retourAccueil() {
      this.semestreSelectionne = null
      this.currentView = 'SemestreList'
    },
    releve(etudiant) {
      this.etudiant = etudiant
      this.currentView = 'Releve'
    },
    infosEtu(etudiant) {
      this.etudiant = etudiant
      this.currentView = 'InfosEtu'
    }
  }
}
</script>


<template>
  <div id="app">
    <h1>Gestion des Semestres</h1>

    <!-- Vue dynamique -->
    <component 
      :is="currentView" 
      :semestreSelectionne="semestreSelectionne"
      :etudiant="etudiant"
      @voir-etudiants="ouvrirEtudiants"
      @retour="retourAccueil"
      @releve="releve"
      @infosEtu="infosEtu"
    />
  </div>
</template>


<style>
#app {
  max-width: 800px;
  margin: auto;
  padding: 20px;
  font-family: "Poppins", sans-serif;
}
</style>
