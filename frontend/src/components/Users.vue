<template>

  <v-col class="mb-5" cols="12">
    <v-item-group multiple>
      <v-container>
        <v-row>
          <v-col
            v-for="user in users" :key="user.id"
            cols="12"
            md="4"
          >
            <v-item>
              <v-card
                class="mx-auto"
                max-width="344"
                outlined
              >
                <v-list-item three-line>
                  <v-list-item-content>
                    <v-list-item-title class="headline mb-1">{{ user.username }}</v-list-item-title>
                  </v-list-item-content>

                </v-list-item>

                <v-card-actions>
                  <v-btn text>Button</v-btn>
                  <v-btn text>Button</v-btn>
                </v-card-actions>
              </v-card>
            </v-item>
          </v-col>
        </v-row>
      </v-container>
    </v-item-group>
  </v-col>

</template>

<script>
  import axios from 'axios'

  const endpoint = 'http://localhost/api/'

  export default {
    name: 'Users',

    data: () => ({
      users: [
        { 'id': 5, 'username': 'Huguinho' },
        { 'id': 6, 'username': 'Zezinho' },
        { 'id': 7, 'username': 'Luizinho' },
        { 'id': 8, 'username': 'Tio Patinhas' },
        { 'id': 9, 'username': 'Pato Donald' },
      ]
    }),
    created() {
      axios.get(endpoint + 'users/')
        .then(response => {
          response.data.map(item => {
            return this.users.push(item)
          })
        })
    }
  }
</script>
