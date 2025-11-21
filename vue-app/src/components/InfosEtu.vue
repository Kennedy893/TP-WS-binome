<template>
  <div class="moyennes">
    <h2>Moyennes de {{ etudiant.nom }} {{ etudiant.prenoms }}</h2>

    <div v-if="loading">Chargement des moyennes...</div>
    <div v-else-if="error">{{ error }}</div>
    <div v-else>
      <table class="table-moyennes">
        <thead>
          <tr>
            <th>Semestre</th>
            <th>Moyenne</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="m in moyennes" :key="m.semestreId">
            <td>{{ m.nomSemestre }}</td>
            <td>{{ m.moyenne.toFixed(2) }}</td>
          </tr>
        </tbody>
      </table>
    </div>

    <button @click="emit('L1')">L1</button>
    <button @click="emit('L2')">L2</button>
    <br>

    <button @click="$emit('retour')">⬅ Retour</button>
  </div>
</template>

<script>
export default {
  name: 'InfosEtu',
  props: ['etudiant'],
  data() {
    return {
      moyennes: [],
      loading: true,
      error: null
    }
  },
  async mounted() {
    if (!this.etudiant) return

    try {
      const semestres = [1, 2, 3, 4]  // semestres 1 à 4
      const results = []

      for (const semestreId of semestres) {
        const response = await fetch(
          `http://localhost:8080/etudiants/${this.etudiant.id}/semestres/${semestreId}/moyenne`
        )
        const json = await response.json()

        if (json.status === 'success') {
          // Assurer qu'on a une valeur
          const moyenne = json.data.length > 0 ? json.data[0].moyenne : 0
          results.push({
            semestreId,
            nomSemestre: `Semestre ${semestreId}`,
            moyenne
          })
        } else {
          results.push({
            semestreId,
            nomSemestre: `Semestre ${semestreId}`,
            moyenne: 0
          })
        }
      }

      this.moyennes = results
    } catch (err) {
      this.error = err.message
    } finally {
      this.loading = false
    }
  }
}
</script>

<style scoped>
.table-moyennes {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
}
.table-moyennes th,
.table-moyennes td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: center;
}
.table-moyennes th {
  background-color: #f4f4f4;
}
button {
  margin-top: 20px;
  padding: 8px 14px;
  border: none;
  background: #1976d2;
  color: white;
  border-radius: 6px;
  cursor: pointer;
}
button:hover {
  background: #1565c0;
}
</style>
