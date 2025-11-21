<template>
  <div>
    <h1>Frontend VueJS</h1>
    <p>{{ message }}</p>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'

const message = ref('Chargement...')
onMounted(async () => {
  const res = await fetch('http://localhost:8081/api/hello')
  message.value = await res.text()
})
</script>
