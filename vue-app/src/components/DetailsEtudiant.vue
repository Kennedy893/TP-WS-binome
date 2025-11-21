<template>
  <div class="details-etudiant">
    <h3>Détails de l'étudiant</h3>

    <div v-if="loading" class="loading-text">Chargement des informations...</div>

    <div v-else-if="etudiant" class="details-card">
      <dl class="details-list">
        <dt>Nom :</dt>
        <dd>{{ etudiant.nom }}</dd>
        <dt>Prénoms :</dt>
        <dd>{{ etudiant.prenoms }}</dd>
        <dt>Date de naissance :</dt>
        <dd>{{ formatDate(etudiant.dateNaissance) }}</dd>
        <dt>Lieu de naissance :</dt>
        <dd>{{ etudiant.lieuNaissance }}</dd>
        <dt>Numéro d'inscription :</dt>
        <dd>{{ etudiant.numInscription }}</dd>
      </dl>

      <h4>Moyennes par semestre :</h4>
      <ul class="moyennes-list">
        <li v-for="(moy, index) in moyennesSemestres" :key="index">
          {{ moy.nomSemestre }} : {{ moy.moyenne.toFixed(2) }}
        </li>
      </ul>

      <button @click="$emit('retour')" class="retour-btn">⬅ Retour</button>
    </div>

    <div v-else class="error-card">
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
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  background-color: #ffffff;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

h3 {
  font-size: 1.25rem;
  color: #333333;
  margin-bottom: 20px;
  text-align: center;
  border-bottom: 1px solid #e0e0e0;
  padding-bottom: 10px;
}

.details-card,
.error-card {
  padding: 16px;
  background-color: #f8f9fa;
  border: 1px solid #dee2e6;
  border-radius: 8px;
}

.details-list {
  display: grid;
  grid-template-columns: auto 1fr;
  gap: 8px;
  margin-bottom: 20px;
}

dt {
  font-weight: 600;
  color: #495057;
}

dd {
  color: #212529;
}

h4 {
  font-size: 1.1rem;
  color: #333333;
  margin-top: 20px;
  margin-bottom: 10px;
}

.moyennes-list {
  list-style: none;
  padding: 0;
}

.moyennes-list li {
  padding: 8px 0;
  border-bottom: 1px solid #e0e0e0;
  color: #495057;
}

.moyennes-list li:last-child {
  border-bottom: none;
}

.loading-text,
.error-card p {
  text-align: center;
  color: #6c757d;
  font-style: italic;
}

.retour-btn {
  margin-top: 20px;
  padding: 10px 20px;
  border: none;
  background-color: #007bff;
  color: white;
  border-radius: 6px;
  cursor: pointer;
  font-weight: 500;
  transition: background-color 0.3s ease;
  display: block;
  margin-left: auto;
  margin-right: auto;
}

.retour-btn:hover {
  background-color: #0056b3;
}
</style>