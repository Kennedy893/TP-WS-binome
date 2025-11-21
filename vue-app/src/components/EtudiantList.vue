<template>
  <div class="etudiant-list">
    <h3>Étudiants du {{ semestreSelectionne.nomSemestre }}</h3>

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
          <td>{{ etu.moyenne.toFixed(2) }}</td>
        </tr>
      </tbody>
    </table>

    <p v-else>Chargement des étudiants...</p>

    <button @click="$emit('retour')" class="retour-btn">⬅ Retour</button>
  </div>
</template>

<script>
export default {
  name: 'EtudiantList',
  props: ['semestreSelectionne'],
  data() {
    return {
      etudiants: []
    }
  },
  async mounted() {
    await this.fetchEtudiants()
  },
  methods: {
    async fetchEtudiants() {
      try {
        const response = await fetch(`http://localhost:8080/semestres/${this.semestreSelectionne.id}/etudiants/`)
        const json = await response.json()

        if (json.status === 'success') {
          this.etudiants = json.data
        } else {
          console.error('Erreur API :', json.message)
        }
      } catch (error) {
        console.error('Erreur lors du chargement des étudiants :', error)
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
</style>
