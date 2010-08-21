class CommentablesController < ApplicationController
  # GET /commentables
  # GET /commentables.xml
  def index
    @commentables = Commentable.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @commentables }
    end
  end

  # GET /commentables/1
  # GET /commentables/1.xml
  def show
    @commentable = Commentable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @commentable }
    end
  end

  # GET /commentables/new
  # GET /commentables/new.xml
  def new
    @commentable = Commentable.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @commentable }
    end
  end

  # GET /commentables/1/edit
  def edit
    @commentable = Commentable.find(params[:id])
  end

  # POST /commentables
  # POST /commentables.xml
  def create
    @commentable = Commentable.new(params[:commentable])

    respond_to do |format|
      if @commentable.save
        format.html { redirect_to(@commentable, :notice => 'Commentable was successfully created.') }
        format.xml  { render :xml => @commentable, :status => :created, :location => @commentable }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @commentable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /commentables/1
  # PUT /commentables/1.xml
  def update
    @commentable = Commentable.find(params[:id])

    respond_to do |format|
      if @commentable.update_attributes(params[:commentable])
        format.html { redirect_to(@commentable, :notice => 'Commentable was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @commentable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /commentables/1
  # DELETE /commentables/1.xml
  def destroy
    @commentable = Commentable.find(params[:id])
    @commentable.destroy

    respond_to do |format|
      format.html { redirect_to(commentables_url) }
      format.xml  { head :ok }
    end
  end
end
