@extends('adminpanel.panel')

@section('body')
  
    <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Cv
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/{{ LaravelLocalization::setLocale() }}/cv"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Cv</li>
      </ol>


    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
    
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">All Cv</h3>
              <!-- <div class="pull-right"><a href="/cms/gallery/create"  class="btn btn-info">Add new</a></div> -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>ID</th>
                  <th>AD Soyad</th>
                  <th>email</th>
                  <th>phone</th>
                  <th>age</th>
                  <th>university</th>
                  <th>file</th>
                  <th>date</th>
                  <th>action</th>
                </tr>
                </thead>
                <tbody>

                @foreach ($cvs as $cv)
                  <tr>
                    <th>{{ $cv->id }}</th>
                    <th>{{ $cv->first_name.' '.$cv->last_name }} </th>
                    <th>{{ $cv->email }}</th>
                    <th>{{ $cv->phone }}</th>
                    <th>{{ $cv->age }}</th>
                    <th>{{ $cv->university }}</th>
                    <th>{{ $cv->file_name }}</th>
                    <th>{{ $cv->created_at }}</th>
                    <th><button type="button" class="btn btn-danger">delete</button></th>
                  </tr>
                @endforeach

                </tbody>
                <tfoot>
                <tr>
                  <th>ID</th>
                  <th>AD Soyad</th>
                  <th>email</th>
                  <th>phone</th>
                  <th>age</th>
                  <th>university</th>
                  <th>file</th>
                  <th>date</th>
                  <th>action</th>
                </tr>
                </tfoot>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->




<!-- Bootstrap 3.3.6 -->
<!-- DataTables -->


<script>
  $(function () {
    $("#example1").DataTable();
    // $('#example2').DataTable({
    //   "paging": true,
    //   "lengthChange": false,
    //   "searching": false,
    //   "ordering": true,
    //   "info": true,
    //   "autoWidth": false
    // });
  });
</script>



  </div>
  <!-- /.content-wrapper -->



@stop