<template>
  <v-col class="mb-5" cols="12">
    <v-item-group multiple>
      <v-container>
        <v-row>
          <v-col v-for="user in users" :key="user.id" cols="12" md="4">
            <v-item>
              <v-card class="mx-auto" max-width="344" outlined>
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

// RTA
const baseurl = window.location.href
const endpoint = baseurl.substring(0, baseurl.length - 1).concat(':8000/api/')

export default {
  name: 'Users',
  data: () => ({
    users: [
      { 'id': 100, 'username': 'Huguinho' },
      { 'id': 101, 'username': 'Zezinho' },
      { 'id': 102, 'username': 'Luizinho' },
    ]
  }),
  created() {
    axios.get(endpoint + 'users/')
      .then(response => {
        response.data.data.map(item => {
          return this.users.push(item)
        })
      })
  }
}
</script>