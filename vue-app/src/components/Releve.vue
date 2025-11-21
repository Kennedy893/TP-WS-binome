<template>
  <div class="releve-container">
    <h2>Relevé de notes de {{ etudiant.nom }} {{ etudiant.prenoms }} - {{ semestreSelectionne.nomSemestre }}</h2>

    <div v-if="loading" class="loading-text">Chargement...</div>
    <div v-else-if="error" class="error-text">{{ error }}</div>

    <table v-else class="releve-table">
      <thead>
        <tr>
          <th>UE</th>
          <th>Code UE</th>
          <th>Note</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="note in notes" :key="note.codeUE" class="table-row">
          <td>{{ note.nomUE }}</td>
          <td>{{ note.codeUE }}</td>
          <td>{{ note.valeurNote }}</td>
        </tr>
      </tbody>
    </table>

    <button @click="$emit('retour')" class="retour-btn">⬅ Retour</button>
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
        `${import.meta.env.VITE_BACK_BASE_URL}/etudiants/${this.etudiant.id}/semestre/${this.semestreSelectionne.id}`
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

<style scoped>
.releve-container {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  background-color: #ffffff;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

h2 {
  font-size: 1.5rem;
  color: #333333;
  margin-bottom: 20px;
  text-align: center;
  border-bottom: 1px solid #e0e0e0;
  padding-bottom: 10px;
}

.releve-table {
  width: 100%;
  border-collapse: separate;
  border-spacing: 0;
  margin-top: 20px;
  border: 1px solid #dee2e6;
  border-radius: 8px;
  overflow: hidden;
}

.releve-table th,
.releve-table td {
  padding: 12px 16px;
  text-align: left;
}

.releve-table th {
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

.loading-text,
.error-text {
  text-align: center;
  color: #6c757d;
  font-style: italic;
  margin: 20px 0;
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