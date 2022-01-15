<template>
  <v-container>
    <v-autocomplete
      v-model="value"
      :items="items"
      dense
      filled
      label="Filled"
    ></v-autocomplete>
    </v-container>
</template>
<script>
export default {
  data: () => ({
    items: ['foo', 'bar', 'fizz', 'buzz'],
    values: ['foo', 'bar'],
    value: null,
  }),
}
</script>
