<script>
export default {
  data() {
    return {
      products: [
        {
          name: "Casque Bluetooth Sony WH-1000XM5",
          description: "<b>Casque sans fil à réduction de bruit active</b>, autonomie de 30h.",
          unit_price: 89.99,
          quantity: 8
        },
        {
          name: "Clavier Mécanique Logitech G Pro X",
          description: "<i>Switchs interchangeables</i>, rétroéclairage RGB et câble détachable.",
          unit_price: 69.99,
          quantity: 1
        },
        {
          name: "Souris sans fil Logitech MX Master 3S",
          description: "Suivi précis, <u>connexion multi-appareils</u> et recharge USB-C.",
          unit_price: 49.00,
          quantity: 1
        },
        {
          name: "Clé USB SanDisk 128 Go",
          description: "Transfert rapide en <b>USB 3.1</b>.",
          unit_price: 12.99,
          quantity: 2
        }
      ]
    }
  },

  computed: {
    productsLength() {
      return this.products.length;
    },

    productsTotal() {
      let data = {};
      this.products.forEach((product, index) => {
        data[index] = product.unit_price * product.quantity;
      })
      return data;
    },

    totalExclTaxes() {
      let total = 0;
      Object.values(this.productsTotal).forEach((product_total) => {
        total += parseFloat(product_total);
      })
      return total;
    },

    totalTaxes() {
      return this.totalExclTaxes * 20 / 100;
    },

    totalInclTaxes() {
      return this.totalExclTaxes + this.totalTaxes;
    },

    isCartSup100() {
      return this.totalInclTaxes >= 100;
    },

    lackForShippingCosts() {
      return !this.isCartSup100 ? 100 - this.totalInclTaxes : null
    }
  },

  methods: {
    getTotalProduct(product) {
      return product.unit_price * product.quantity;
    }
  }
}
</script>

<template>
  <div>
    <!-- Titre principal -->
    <h1 class="text-xl p-4 text-center uppercase mb-4 bg-sky-300 text-sky-800">
      Panier des produits <br>
      Nombre de produits : {{ products.length }}
    </h1>

    <div class="container mx-auto px-4 py-6">
      <h2 class="text-2xl font-bold text-gray-800 mb-6 text-center">
        🛒 Liste des produits du panier
      </h2>

      <!-- Tableau des produits -->
      <div v-if="products.length > 0" class="overflow-x-auto">
        <table class="min-w-full border border-gray-300 bg-white rounded-lg shadow">
          <thead class="bg-sky-100 text-sky-700">
            <tr>
              <th class="border px-4 py-2 text-left">Nom</th>
              <th class="border px-4 py-2 text-left">Description</th>
              <th class="border px-4 py-2 text-center">Prix unitaire (€)</th>
              <th class="border px-4 py-2 text-center">Quantité</th>
              <th class="border px-4 py-2 text-center">Total HT (€)</th>
            </tr>
          </thead>

          <tbody>
            <tr
              v-for="product in products"
              :key="product.id"
              class="hover:bg-gray-50"
            >
              <td class="border px-4 py-2 font-semibold text-gray-800">
                {{ product.name }}
              </td>
              <td class="border px-4 py-2 text-gray-700">
                <div v-html="product.description"></div>
              </td>
              <td class="border px-4 py-2 text-center">
                {{ product.unit_price.toFixed(2) }}
              </td>
              <td class="border px-4 py-2 text-center">
                {{ product.quantity }}
              </td>
              <td class="border px-4 py-2 text-center font-medium text-gray-800">
                {{ (product.unit_price * product.quantity).toFixed(2) }}
              </td>
            </tr>
          </tbody>

          <!-- Pied du tableau -->
          <tfoot class="bg-gray-100 font-semibold text-gray-800">
            <tr>
              <td colspan="4" class="text-right px-4 py-2">Total HT :</td>
              <td class="text-center px-4 py-2">{{ totalExclTaxes.toFixed(2) }} €</td>
            </tr>
            <tr>
              <td colspan="4" class="text-right px-4 py-2">TVA (20%) :</td>
              <td class="text-center px-4 py-2">{{ totalTaxes.toFixed(2) }} €</td>
            </tr>
            <tr :class="{'bg-green-500': isCartSup100}" class="bg-sky-200 text-sky-800">
              <td colspan="4" class="text-right px-4 py-2">Total TTC :</td>
              <td class="text-center px-4 py-2 font-bold">
               {{ totalInclTaxes.toFixed(2) }} €
              </td>
            </tr>
          </tfoot>
        </table>
      </div>

      <!-- Message si aucun produit -->
      <div v-else class="text-center text-gray-500 text-lg py-10">
        Aucun produit dans le panier 😔
      </div>

      <div v-if="!isCartSup100">
        <p class="text-sm bg -indigo-400">Plus que <b>{{ lackForShippingCosts }} € </b> pour avoir les frais de port offert</p>
      </div>
    </div>
  </div>
</template>

<style scoped>
table {
  border-collapse: collapse;
}

th,
td {
  border: 1px solid #ccc;
}

tfoot td {
  font-weight: bold;
}
</style>