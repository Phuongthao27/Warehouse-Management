<template>
  <CCard>
    <CCardHeader>
      <slot name="header">
        <CIcon name="cil-justify-center"/><strong>Category Add </strong>
      </slot>
    </CCardHeader>
    <CCardBody>
      <v-text-field
        label="Category Id"
        :rules="rules"
        hide-details="auto"
      ></v-text-field>
      <v-text-field :rules="rules"  label="Category name"></v-text-field>
      <v-text-field label="Create date"></v-text-field>
      <v-text-field label="Update date"></v-text-field>
      <div style="float:right">
        <v-btn
          color="blue"
          elevation="2"
        >Submit</v-btn>
        <v-btn

          color="blue"
          elevation="2"
          @click="backToList"
        >Cancel</v-btn>
      </div>


    </CCardBody>
  </CCard>
</template>

<script>
export default {
  name: 'Table',
  data: () => ({
    rules: [
      value => !!value || '*',
      value => (value && value.length >= 3) || 'Min 3 characters',
    ],
  }),
  methods:{
    backToList(){
      this.$router.push({path:'/base/CategoryList'});
    }
  }
}
</script>
<style>
.slt{
  margin-left: -400px;
}
.btn{
color: blue;
}
</style>
