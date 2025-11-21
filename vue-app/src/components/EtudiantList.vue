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
        <tr v-for="etu in etudiants" :key="etu.id" class="table-row">
          <td>
            <a href="#" @click.prevent="$emit('voir-details', etu)" class="nom-link">
              {{ etu.nom }}
            </a>
          </td>
          <td>{{ etu.prenoms }}</td>
          <td><button @click="$emit('releve', etu)" class="moyenne-btn">{{ etu.moyenne.toFixed(2) }}</button></td>
        </tr>
      </tbody>
    </table>

    <p v-else class="loading-text">Chargement des étudiants...</p>

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
.etudiant-list {
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

.table-etudiants {
  width: 100%;
  border-collapse: separate;
  border-spacing: 0;
  margin-top: 20px;
  border: 1px solid #dee2e6;
  border-radius: 8px;
  overflow: hidden;
}

.table-etudiants th,
.table-etudiants td {
  padding: 12px 16px;
  text-align: left;
}

.table-etudiants th {
  background-color: #f8f9fa;
  color: #495057;
  font-weight: 600;
  border-bottom: 1px solid #dee2e6;
}

.table-row:nth-child(even) {
  background-color: #f8f9fa;
}

.table-row:hover {
  background-color: #e9ecef;
}

.nom-link {
  color: #007bff;
  text-decoration: none;
  font-weight: 500;
}

.nom-link:hover {
  text-decoration: underline;
  color: #0056b3;
}

.moyenne-btn {
  background-color: #6c757d;
  color: white;
  border: none;
  padding: 6px 12px;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.moyenne-btn:hover {
  background-color: #5a6268;
}

.loading-text {
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
