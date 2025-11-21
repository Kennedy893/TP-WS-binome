<template>
  <div class="etudiant-list">
    <h3>Étudiants du {{ semestreSelectionne.nomSemestre }}</h3>

    <p>Cette section affichera les étudiants avec leur moyenne.</p>

    <button @click="$emit('retour')" class="retour-btn">⬅ Retour</button>
  </div>
</template>

<script>
export default {
  name: 'EtudiantList',
  props: ['semestreSelectionne']
}
</script>

<style scoped>
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