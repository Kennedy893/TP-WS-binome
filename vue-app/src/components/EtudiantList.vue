<template>
  <div class="etudiant-list">
    <h3>Étudiants du {{ semestreSelectionne.nomSemestre }}</h3>

    <!-- Table principale -->
    <table v-if="etudiants.length" class="table-etudiants">
      <thead>
        <tr>
          <th>Nom</th>
          <th>Prénoms</th>
          <th>Moyenne</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="etu in etudiants" :key="etu.id">
          <td>
            <a href="#" @click.prevent="$emit('voir-details', etu)" class="nom-link">
              {{ etu.nom }}
            </a>
          </td>
          <td>{{ etu.prenoms }}</td>
          <td>
            <button @click="$emit('releve', etu)">
              {{ etu.moyenne.toFixed(2) }}
            </button>
          </td>
        </tr>
      </tbody>
    </table>

    <p v-else>Chargement des étudiants...</p>

    <!-- Section des moyennes détaillées -->
    <div v-if="etudiantsMoyennes.length" class="moyennes-details">
      <h4>Moyennes détaillées par option</h4>
      <div v-for="m in etudiantsMoyennes" :key="m.etudiantId + '-' + m.semestreId">
        <strong>{{ m.nomEtudiant }} {{ m.prenomsEtudiant }} :</strong>
        {{ m.moyenne.toFixed(2) }}
      </div>
    </div>

    <button @click="$emit('retour')" class="retour-btn">⬅ Retour</button>
  </div>
</template>

<script>
export default {
  name: 'EtudiantList',
  props: ['semestreSelectionne'],
  data() {
    return {
      etudiants: [],
      etudiantsMoyennes: [] // pour stocker toutes les moyennes détaillées
    }
  },
  async mounted() {
    await this.fetchEtudiants()
    await this.fetchMoyennes()
  },
  methods: {
    async fetchEtudiants() {
      try {
        const response = await fetch(`${import.meta.env.VITE_BACK_BASE_URL}/semestres/${this.semestreSelectionne.id}/etudiants/`)
        const json = await response.json()

        if (json.status === 'success') {
          this.etudiants = json.data
        } else {
          console.error('Erreur API :', json.message)
        }
      } catch (error) {
        console.error('Erreur lors du chargement des étudiants :', error)
      }
    },
    async fetchMoyennes() {
      try {
        const moyennesResults = []

        for (const etu of this.etudiants) {
          const response = await fetch(`${import.meta.env.VITE_BACK_BASE_URL}/etudiants/${etu.id}/semestres/${this.semestreSelectionne.id}/moyenne`)
          const json = await response.json()

          if (json.status === 'success') {
            json.data.forEach(m => {
              moyennesResults.push({
                etudiantId: etu.id,
                nomEtudiant: etu.nom,
                prenomsEtudiant: etu.prenoms,
                semestreId: this.semestreSelectionne.id,
                nomSemestre: m.nomSemestre,
                moyenne: m.moyenne
              })
            })
          }
        }

        this.etudiantsMoyennes = moyennesResults
      } catch (err) {
        console.error('Erreur lors du chargement des moyennes détaillées :', err)
      }
    }
  }
}
</script>

<style scoped>
.table-etudiants {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
}
.table-etudiants th,
.table-etudiants td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: left;
}
.table-etudiants th {
  background-color: #f4f4f4;
}
.nom-link {
  color: #1976d2;
  cursor: pointer;
  text-decoration: underline;
}
.nom-link:hover {
  color: #1565c0;
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
.moyennes-details {
  margin-top: 20px;
  padding-top: 10px;
  border-top: 1px solid #ccc;
}
</style>
