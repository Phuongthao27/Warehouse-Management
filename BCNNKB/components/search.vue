<template>
  <v-container>
    <v-spacer></v-spacer>
    <v-text-field
      append-icon="search"
      label="Search"
      single-line
      hide-details
      v-model="search"
    ></v-text-field>
    </v-container>
</template>
<script>
export default {
  data () {
    return {
      search : ''
    }

  }

}
</script>
