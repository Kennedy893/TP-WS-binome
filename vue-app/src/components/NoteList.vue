<template>
  <div class="note-list">
    <h4>Notes de {{ etudiant.nom }} ({{ semestre.nom }})</h4>
    <table>
      <thead>
        <tr>
          <th>Matière</th>
          <th>Note</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="n in notes" :key="n.matiere">
          <td>{{ n.matiere }}</td>
          <td>{{ n.valeur }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  name: 'NoteList',
  props: ['etudiant', 'semestre'],
  data() {
    return {
      notes: []
    }
  },
  mounted() {
    // Simulation d’un appel API
    this.notes = [
      { matiere: 'Mathématiques', valeur: 15 },
      { matiere: 'Physique', valeur: 13 },
      { matiere: 'Informatique', valeur: 16 }
    ]
  }
}
</script>

<style scoped>
.note-list {
  margin-top: 20px;
}
table {
  width: 100%;
  border-collapse: collapse;
}
th, td {
  padding: 8px;
  border-bottom: 1px solid #ddd;
}
th {
  background-color: #f1f1f1;
}
</style>
