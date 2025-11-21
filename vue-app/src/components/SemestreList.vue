<template>
  <div class="semestre-list">
    <h2>Liste des Semestres</h2>

    <ul v-if="semestres.length" class="semestre-grid">
      <li 
        v-for="sem in semestres" 
        :key="sem.id"
        @click="$emit('voir-etudiants', sem)"
        class="semestre-item"
      >
        {{ sem.nomSemestre }}
      </li>
    </ul>

    <p v-else class="loading-text">Chargement des semestres...</p>
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
        const response = await fetch(`${import.meta.env.VITE_BACK_BASE_URL}/semestres/`)
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
.semestre-list {
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

.semestre-grid {
  list-style: none;
  padding: 0;
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 16px;
}

.semestre-item {
  cursor: pointer;
  padding: 16px;
  background-color: #f8f9fa;
  border: 1px solid #dee2e6;
  border-radius: 8px;
  text-align: center;
  font-weight: 500;
  color: #495057;
  transition: all 0.3s ease;
}

.semestre-item:hover {
  background-color: #e9ecef;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  transform: translateY(-2px);
}

.loading-text {
  text-align: center;
  color: #6c757d;
  font-style: italic;
}
</style>