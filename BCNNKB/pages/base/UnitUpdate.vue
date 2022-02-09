<template>
  <CCard>
    <CCardHeader>
      <slot name="header">
        <CIcon name="cil-justify-center"/><strong>Units update </strong>
      </slot>
    </CCardHeader>
    <CCardBody>
      <v-text-field :rules="rules" v-model="unitName" label="Unit name"></v-text-field>

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
    unitId:"",
    unitName:"",
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
      this.$router.push({path: '/base/UnitList'});
      let id = this.$route.query.id
      console.log("id cate" + id)
    },
    updateCate() {
      let id = this.$route.query.id
      this.$axios.put('http://localhost:3001/products/' + id,{
        category_name : this.cateName,
        create_date : this.createDate,
        create_update : this.updateDate
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
      this.$axios
        .get('http://localhost:3001/units/'+id)
        .then((response) =>{
          this.unitId = response.data.unit_id
          this.unitName = response.data.unit_name
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
