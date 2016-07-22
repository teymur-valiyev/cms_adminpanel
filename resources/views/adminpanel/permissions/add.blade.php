@extends('adminpanel.panel')

@section('body')

<link rel="stylesheet" href="{{ asset("adminassets/plugins/select2/select2.min.css") }}">

<div class="content-wrapper">
   <section class="content-header">
      <h1>
        Permissions
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/{{ LaravelLocalization::setLocale() }}/cms"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="/{{ LaravelLocalization::setLocale() }}/cms/permissions">Permissions</a></li>
        <li class="active">Add</li>
      </ol>
    </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">

      <div class="col-md-1"></div>
      <!-- right column -->
      <div class="col-md-10">
        <!-- Horizontal Form -->
        <div class="box box-info">
          <div class="box-header with-border">
            <h3 class="box-title">Permission Add</h3>
          </div>
          <!-- /.box-header -->
          <!-- form start -->
          <form class="form-horizontal" method="Post" action="{{ url(LaravelLocalization::setLocale().'/cms/permissions/') }}">
            <div class="box-body">

            @if (count($errors) > 0)
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

                    
            <div class="flash-message">
               @if(Session::has('alert-success'))
                <p class="alert alert-success">{{ Session::get('alert-success') }} 
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                </p>
              @endif
            </div>
            
              <div class="form-group">
                <label for="inputTitle" class="col-sm-2 control-label">title</label>

                <div class="col-sm-10">
                  <input type="text" class="form-control" name="name" id="inputTitle" placeholder="name" name="title" value="{{ old('name') }}">
                </div>
              </div>
              <div class="form-group">
                <label for="inputdescription" class="col-sm-2 control-label">description</label>

                <div class="col-sm-10">
                  <input type="text" class="form-control" id="inputdescription" placeholder="description" name="description" value="{{ old('description') }}">
                </div>
              </div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
              
             
              <input type="hidden" name="_token" value="{{ csrf_token() }}">

              <a href="/cms/permissions" class="btn btn-default">Cancel</a>

              <button type="submit" class="btn btn-info pull-right">Save</button>
            </div>
            <!-- /.box-footer -->
          </form>
        </div>
        <!-- /.box -->

      </div>
      <!--/.col (right) -->
    </div>
    <!-- /.row -->
  </section>
  <!-- /.content -->
</div>

@stop