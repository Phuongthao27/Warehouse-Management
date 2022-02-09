<template>
  <CCard>
    <CCardHeader>
      <slot name="header">
        <CIcon name="cil-justify-center"/><strong>Supplier update </strong>
      </slot>
    </CCardHeader>
    <CCardBody>
      <v-text-field :rules="rules" v-model="supplierName" label="Supplier name"></v-text-field>

      <div style="float:right">

        <v-btn
          color="blue"
          elevation="2"
          @click="updateCate"
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
    id:"",
    supplierName:"",
    rules: [

      value => !!value || '*',
      value => (value && value.length >= 3) || 'Min 3 characters',
    ],
  }),
  mounted() {
    this.getListUnit()
  },
  methods: {
    backToList() {
      this.$router.push({path: '/base/SupplierList'});
      let id = this.$route.query.id
      console.log("id cate" + id)
    },
    updateCate() {
      let id = this.$route.query.id
      this.$axios.put('http://localhost:3001/supplier/' + id,{
        supplier_name : this.supplierName,
      }).then(resp =>{
        console.log(resp)
        alert("Cập nhật thành công!");
      })
        .catch((err) => {
          console.log(err)
        });
    },

    getListUnit(){
      let id = this.$route.query.id
      console.log(id)
      this.$axios
        .get('http://localhost:3001/supplier/'+id)
        .then((response) =>{
          this.supplierName = response.data.supplier_name
          console.log(response.data)
        }).catch((err)=>{
        console.log(err)
      });
    },


  },

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
