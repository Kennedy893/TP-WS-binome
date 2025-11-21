<template>
  <div class="semestre-list">
    <h2>Liste des Semestres</h2>

    <ul v-if="semestres.length">
      <li 
        v-for="sem in semestres" 
        :key="sem.id"
        @click="$emit('voir-etudiants', sem)"
        class="semestre-item"
      >
        {{ sem.nomSemestre }}
      </li>
    </ul>

    <p v-else>Chargement des semestres...</p>
  </div>
</template>

<script>
export default {
  name: 'SemestreList',
  data() {
    return {
      semestres: []
    }
  },
  async mounted() {
    await this.getSemestres()
  },
  methods: {
    async getSemestres() {
      try {
        const response = await fetch('http://localhost:8080/semestres/')
        const json = await response.json()
        if (json.status === 'success') {
          this.semestres = json.data
        } else {
          console.error('Erreur API :', json.message)
        }
      } catch (error) {
        console.error('Erreur lors du chargement des semestres :', error)
      }
    }
  }
}
</script>

<style scoped>
.semestre-item {
  cursor: pointer;
  padding: 10px;
  margin: 6px 0;
  background: #f1f1f1;
  border-radius: 8px;
  transition: background 0.3s;
}
.semestre-item:hover {
  background: #dfe6e9;
}
</style>
