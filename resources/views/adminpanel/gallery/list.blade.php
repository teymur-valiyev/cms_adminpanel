@extends('adminpanel.panel')

@section('body')

  <link rel="stylesheet" href="{{ asset("lightbox2/css/lightbox.min.css") }}">
	
	  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Galery
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/{{ LaravelLocalization::setLocale() }}/cms"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Gallary</li>
      </ol>
    </section>


    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
    
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Gallary list</h3>
              <div class="pull-right">
                  <a href="/cms/gallery/create"  class="btn btn-info">
                    <i class="fa fa-plus" aria-hidden="true"></i>
                  </a>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Galery ID</th>
                  <th>title</th>
                  <th>description</th>
                  <th>ordering</th>
                  <th>status
                  <th>file</th>
                  <th>action</th>
                </tr>
                </thead>
                <tbody>

              @foreach($gallaries as $gallery)
                
                <tr>
                  <td>  {{ $gallery->gallery_id }}  </td>
                  <td>  {{ $gallery->title }}        </td>
                  <td>  {{ $gallery->description }} </td>
                  <td>  {{ $gallery->ordering }}    </td>
                  <td>  {{ $gallery->status }}   </td>
                  <td>  
                    <a href="{{ asset("images/gallery/".$gallery->file )}}" data-lightbox="image-{{ $gallery->gallery_id}}"> 
                      <img src="{{ asset("images/gallery/".$gallery->file )}}" class="img-responsive img-thumbnail" style="height: 100px" alt="">
                    </a>
                   </td>
                  <td>

                  <div class="col-md-3">
                    <a  href="{{ url(LaravelLocalization::setLocale().'/cms/gallery/').'/'.$gallery->gallery_id.'/edit' }}" class="btn btn-default" >
                      <i class="fa fa-pencil" aria-hidden="true"></i>
                    </a>
                  </div>
                  <div class="col-md-2">  
                      <form action="{{ url(LaravelLocalization::setLocale().'/cms/gallery'.'/'.$gallery->gallery_id) }}" method="post"  onsubmit="return confirm('Do you really want to submit the form?');" >
                      
                        <input type="hidden" name="_method" value="DELETE">

                        <input type="hidden" name="_token" value="{{ csrf_token() }}">

                        <button type="submit" class="btn btn-danger">
                          <i class="fa fa-trash-o" aria-hidden="true"></i>
                        </button>  
                       </form>
                    </div>
                  </td>

                </tr>
    
              @endforeach
                  
                </tbody>
                <tfoot>
                <tr>
                  <th>Galery ID</th>
                  <th>name</th>
                  <th>description</th>
                  <th>ordering</th>
                  <th>status</th>
                  <th>file</th>
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



<script>
  $(function () {
    $("#example1").DataTable();

  });
</script>

<script src="{{ asset("lightbox2/js/lightbox.min.js") }}" type="text/javascript" ></script>


  </div>
  <!-- /.content-wrapper -->



@stop