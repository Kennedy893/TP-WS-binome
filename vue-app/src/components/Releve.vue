<template>
  <div>
    <h2>Relevé de notes de {{ etudiant.nom }} {{ etudiant.prenoms }} - {{ semestreSelectionne.nomSemestre }}</h2>

    <div v-if="loading">Chargement...</div>
    <div v-else-if="error">{{ error }}</div>

    <table v-else>
      <thead>
        <tr>
          <th>UE</th>
          <th>Code UE</th>
          <th>Note</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="note in notes" :key="note.codeUE">
          <td>{{ note.nomUE }}</td>
          <td>{{ note.codeUE }}</td>
          <td>{{ note.valeurNote }}</td>
        </tr>
      </tbody>
    </table>

    <button @click="$emit('retour')">⬅ Retour</button>
  </div>
</template>

<script>
export default {
  name: 'Releve',
  props: ['etudiant', 'semestreSelectionne'],
  data() {
    return {
      notes: [],
      loading: true,
      error: null
    }
  },
  async mounted() {
    if (!this.etudiant || !this.semestreSelectionne) return

    try {
      const response = await fetch(
        `http://localhost:8080/etudiants/${this.etudiant.id}/semestre/${this.semestreSelectionne.id}`
      )
      const json = await response.json()

      if (json.status === 'success') {
        this.notes = json.data
      } else {
        this.error = json.message
      }
    } catch (err) {
      this.error = err.message
    } finally {
      this.loading = false
    }
  }
}
</script>
