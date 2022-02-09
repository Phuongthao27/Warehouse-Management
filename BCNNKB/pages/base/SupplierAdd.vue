<template>
  <CCard>
    <CCardHeader>
      <slot name="header">
        <CIcon name="cil-justify-center"/><strong>Unit Add </strong>
      </slot>
    </CCardHeader>
    <CCardBody>
      <v-text-field
        label="Supplier Id"
        :rules="rules"
        v-model="id"
        hide-details="auto"
      ></v-text-field>
      <v-text-field :rules="rules" v-model="supplierName" label="Supplier name"></v-text-field>
      <div style="float:right">
        <v-btn
          color="blue"
          elevation="2"
          @click="addCate"
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
    id :"",
    supplierName :"",
    rules: [
      value => !!value || '*',
      value => (value && value.length >= 3) || 'Min 3 characters',
    ],
  }),
  methods:{
    backToList(){
      this.$router.push({path:'/base/SupplierList'});
    },
    addCate(){
      this.$axios.post('http://localhost:3001/supplier',{
        supplier_id : this.id,
        supplier_name : this.supplierName,
      }).then(resp =>{
        console.log(resp)
        alert("Thêm mới loại hàng thành công!");
      })
        .catch((err) => {
          console.log(err)
        });
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
