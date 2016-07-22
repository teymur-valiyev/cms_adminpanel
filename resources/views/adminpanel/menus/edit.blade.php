@extends('adminpanel.panel')

@section('body')

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Menu
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/{{ LaravelLocalization::setLocale() }}/cms"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="/{{ LaravelLocalization::setLocale() }}/cms/menus"></i> Menu</a></li>
        <li class="active">Edit</li>
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
              <h3 class="box-title">Edit Menu</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal" action="{{ url(LaravelLocalization::setLocale().'/cms/menus').'/'.$menus[0]->menu_id }}" method="Post">
              <div class="box-body">

                    <div><!-- error olanda  -->
                      @if (count($errors) > 0)
                        <div class="alert alert-danger">
                          <ul>
                            @foreach ($errors->all() as $error)
                              <li>{{ $error }}</li>
                            @endforeach
                          </ul>
                        </div>
                      @endif
                    </div>

                  <div class="flash-message">
                      @if(Session::has('alert-success'))
                      <p class="alert alert-success">{{ Session::get('alert-success') }}
                      <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></p>
                      @endif
                  </div> <!-- end .flash-message -->


                   <div class="form-group">
                        <label for="inputvalue" class="col-sm-2 control-label">price</label>
                        <div class="col-sm-10">
                          <input type="text"  name="value" value="{{ $menus[0]->value }}" class="form-control" id="inputvalue" placeholder="price">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="inputtype" class="col-sm-2 control-label">type</label>
                        <div class="col-sm-10">
                          <select name="type" id="inputtype" class="form-control">
                            <option value="">select type...</option>
                            <option @if($menus[0]->type == 'simple') selected @endif value="simple">Simple</option>
                            <option @if($menus[0]->type == 'new') selected @endif value="new">New</option>
                            <option  @if($menus[0]->type == 'recommended') selected @endif value="recommended">Recommended</option>
                          </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputordering_az" class="col-sm-2 control-label">ordering</label>
                        <div class="col-sm-10">
                          <input type="text"  name="ordering" value="{{ $menus[0]->ordering }}" class="form-control" id="inputordering" placeholder="ordering">
                        </div>
                    </div>
                    
                    <div class="form-group">
                      <label for="inputordering" class="col-sm-2 control-label">STATUS</label>
                      <div class="col-sm-10"> 
                        <!-- radio -->
                          <div class="radio">
                            <label>
                              <input type="radio" value="0" name="status" id="status1" value="option1" @if($menus[0]->status == '0') checked @endif>
                              Deactive
                            </label>
                            <label>
                              <input type="radio" value="1" name="status" id="status2" value="option2" @if($menus[0]->status == '1') checked @endif>
                              Active
                            </label>
                          </div>
                      </div>
                    </div>

               <!-- Nav tabs -->
                <ul class="nav nav-tabs nav-justified" role="tablist" id="langtab">
                  <li role="presentation" class="active"><a href="#az" aria-controls="az" role="tab" data-toggle="tab">az</a></li>
                  <li role="presentation"><a href="#ru" aria-controls="ru" role="tab" data-toggle="tab">ru</a></li>
                  <li role="presentation"><a href="#en" aria-controls="en" role="tab" data-toggle="tab">en</a></li>
                </ul>
              
                <br>
              
                <!-- Tab panes -->
                <div class="tab-content">

                @foreach($menus as $menu)
                  <div role="tabpanel" class="tab-pane active" id="{{ $menu->lang }}">
                            
                      <div class="form-group">
                        <label for="inputtitle_{{ $menu->lang }}" class="col-sm-2 control-label">title {{ $menu->lang }}</label>
                        <div class="col-sm-10">
                          <input type="text" name="title_{{ $menu->lang }}" class="form-control" id="inputtitle_{{ $menu->lang }}"  value="{{ $menu->title }}" placeholder="title {{ $menu->lang }}">
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="inputdescription{{ $menu->lang }}" class="col-sm-2 control-label">description {{ $menu->lang }}</label>
                        <div class="col-sm-10">
                          <input type="text" name="description_{{ $menu->lang }}" class="form-control"  value="{{ $menu->description }}" id="inputdescription{{ $menu->lang }}" placeholder="description {{ $menu->lang }}">
                        </div>
                      </div>

                  </div>
                @endforeach

                </div>


              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                
                <input type="hidden" name="_method" value="PUT">
                <input type="hidden" name="_token" value="{{ csrf_token() }}">
                
                <a href="/cms/menus" class="btn btn-default">Cancel</a>
                <button type="submit" class="btn btn-info pull-right">save</button>
              </div>
              <!-- /.box-footer -->
            </form>
          </div>
    
        </div>
        <!--/.col (right) -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


<script type="text/javascript">
    $(document).ready(function(){
        $('#langtab  a:last').tab('show');
    
    });
</script>
  @stop