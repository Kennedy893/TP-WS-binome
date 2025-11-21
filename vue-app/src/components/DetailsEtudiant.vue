<template>
  <div class="details-etudiant">
    <h3>Détails de l'étudiant</h3>

    <div v-if="loading">Chargement des informations...</div>

    <div v-else-if="etudiant">
      <p><strong>Nom :</strong> {{ etudiant.nom }}</p>
      <p><strong>Prénoms :</strong> {{ etudiant.prenoms }}</p>
      <p><strong>Date de naissance :</strong> {{ formatDate(etudiant.dateNaissance) }}</p>
      <p><strong>Lieu de naissance :</strong> {{ etudiant.lieuNaissance }}</p>
      <p><strong>Numéro d'inscription :</strong> {{ etudiant.numInscription }}</p>

      <h4>Moyennes par semestre :</h4>
      <ul>
        <li v-for="(moy, index) in moyennesSemestres" :key="index">
          {{ moy.nomSemestre }} : {{ moy.moyenne.toFixed(2) }}
        </li>
      </ul>

      <button @click="$emit('retour')" class="retour-btn">⬅ Retour</button>
    </div>

    <div v-else>
      <p>Impossible de récupérer les détails de l'étudiant.</p>
      <button @click="$emit('retour')" class="retour-btn">⬅ Retour</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'DetailsEtudiant',
  props: ['etudiantSelectionne'], // ici on attend un objet avec au moins un id
  data() {
    return {
      etudiant: null,
      moyennesSemestres: [],
      loading: true,
    }
  },
  mounted() {
    this.fetchEtudiant()
  },
  methods: {
    async fetchEtudiant() {
      if (!this.etudiantSelectionne || !this.etudiantSelectionne.id) {
        this.loading = false
        return
      }

      try {
        const response = await fetch(`${import.meta.env.VITE_BACK_BASE_URL}/etudiants/${this.etudiantSelectionne.id}`)
        const json = await response.json()

        if (json.status === 'success') {
          this.etudiant = json.data.etudiant
          this.moyennesSemestres = json.data.moyennesSemestres || []
        } else {
          console.error('Erreur API:', json.message)
          this.etudiant = null
          this.moyennesSemestres = []
        }
      } catch (error) {
        console.error('Erreur fetch:', error)
        this.etudiant = null
        this.moyennesSemestres = []
      } finally {
        this.loading = false
      }
    },
    formatDate(dateStr) {
      if (!dateStr) return ''
      const date = new Date(dateStr)
      return date.toLocaleDateString()
    }
  }
}
</script>

<style scoped>
.details-etudiant {
  padding: 10px;
  background: #f9f9f9;
  border-radius: 8px;
  margin-top: 20px;
}
.retour-btn {
  margin-top: 20px;
  padding: 8px 14px;
  border: none;
  background: #1976d2;
  color: white;
  border-radius: 6px;
  cursor: pointer;
}
.retour-btn:hover {
  background: #1565c0;
}
</style>
