<template>
  <CRow>
    <CCol col>
      <CCard>
        <CCardHeader>
          <search></search>
          <CIcon name="cil-justify-center"/><strong>Product list</strong>
          <div class="card-header-actions">
            <a
              href="https://coreui.io/vue/docs/components/breadcrumb"
              class="card-header-action"
              rel="noreferrer noopener"
              target="_blank"
            >
              <small class="text-muted">docs</small>
            </a>
          </div>
        </CCardHeader>
        <CCardBody>
          <dataTable></dataTable>
        </CCardBody>
      </CCard>
    </CCol>
  </CRow>
</template>

<script>
import search from '../../components/search'
import dataTable from "../../components/DataTable";
export default {
  name: 'Breadcrumbs',
  components: {search,dataTable},


}
</script>

<style>
  .breadcrumb-item + .font-xl.breadcrumb-item::before {
    color: rgb(140, 195, 38);
    content: '>>';
    padding: 0px 10px;

  }
</style>
