<?php  $this->load->view("blueline/siparis/header");?>

<div class="col-md-12">
    <!-- Content Wrapper. Contains page content -->
    <div class="">
        <!-- Content Header (Page header) -->
        <section class="content-header">


            <h1>
                Manage
                <small>Products</small>
            </h1>


            <ol class="breadcrumb">
                <li><a href="<?php echo site_url("dashboard")?>"><i class="fa fa-dashboard"></i> Anasayfa</a></li>
                <li class="active">Ürünler</li>


            </ol>


        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div id="messages2">


                </div>


            </div>
            <!-- Small boxes (Stat box) -->
            <div class="row">
                <div class="col-md-12 col-xs-12">

                    <div id="messages"></div>

                    <?php if($this->session->flashdata('success')): ?>
                        <div class="alert alert-success alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <?php echo $this->session->flashdata('success'); ?>
                        </div>
                    <?php elseif($this->session->flashdata('error')): ?>
                        <div class="alert alert-error alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <?php echo $this->session->flashdata('error'); ?>
                        </div>
                    <?php endif; ?>

                    <?php// if(in_array('createProduct', $user_permission)): ?>

                    <a href="<?php echo base_url('products/createPage') ?>" class="btn btn-primary">Ürün Ekle</a>

                    <a href="<?php echo base_url('attributes') ?>" class="btn btn-primary pull-right" >Attirbute </a>




                    <br /> <br />
                    <?php// endif; ?>

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">Manage Products</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="manageTable" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>Image</th>
                                    <th>SKU</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Qty</th>
                                    <th>Store</th>
                                    <th>Availability</th>
                                    <th>Action</th>

                                </tr>
                                </thead>

                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- col-md-12 -->
            </div>
            <!-- /.row -->


        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <?php //if(in_array('deleteProduct', $user_permission)): ?>
    <!-- remove brand modal -->
    <div id="messages1"></div>

    <div class="modal fade" tabindex="-1" role="dialog" id="removeModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Remove Product</h4>
                </div>

                <form role="form" action="<?php echo base_url('ajaxremove/remove') ?>" method="post" id="removeForm">
                    <div class="modal-body">
                        <p>Do you really want to remove?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" >Save changes</button>
                    </div>
                </form>


            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <?php //endif; ?>



</div>


<script type="text/javascript">
var manageTable;
var base_url = "<?php echo site_url(); ?>";

$(document).ready(function() {
    //'ajax': base_url + '/products/fetchProductData',

    $("#mainProductNav").addClass('active');

    // initialize the datatable
    manageTable = $('#manageTable').DataTable({
         //'ajax': 'http://localhost:8080/cocpit/products/fetchProductData',
        //'ajax': 'http://localhost:8080/cocpit/ajaxtest/fetchProductData',
        'ajax': base_url + 'ajaxtest/fetchProductData',


        'order': []

    });
});
// remove functions
function removeFunc(id)
{
  if(id) {
    $("#removeForm").on('submit', function() {

      var form = $(this);

      // remove the text-danger
      $(".text-danger").remove();

      $.ajax({
        url: form.attr('action'),
        type: form.attr('method'),
        data: { product_id:id },
        dataType: 'json',
        success:function(response) {
            alert('silindi aloo');

            manageTable.ajax.reload(null, false);

          if(response.success === true) {
            $("#messages2").html('<div class="alert alert-success alert-dismissible col-md-12" role="alert">'+
              '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
              '<strong> <span class="glyphicon glyphicon-ok-sign"></span> </strong>'+response.messages+
            '</div>');

            // hide the modal
            $("#removeModal").modal('hide');

          } else {

            $("#messages2").html('<div class="alert alert-warning alert-dismissible" role="alert">'+
              '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
              '<strong> <span class="glyphicon glyphicon-exclamation-sign"></span> </strong>'+response.messages+
            '</div>');
          }
        }
      });

      return false;
    });
  }
}


</script>
</html>

