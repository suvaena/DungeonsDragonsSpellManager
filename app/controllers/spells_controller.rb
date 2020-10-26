class SpellsController < ApplicationController

  # GET /users
  def index
    @spells = Spell.order("level ASC, name ASC").all
  end
  
  def find_all
      @spells = Spell.all
  end

  # GET /users/:id
  def show
    @spell = Spell.find(params[:id])
  end

  # GET /users/new
  def new
    @spell = Spell.new
  end

  # GET /users/:id/edit
  def edit
    @spell = Spell.find(params[:id])
  end

  # POST /users
  def create
    # active record new, create, and update allow us to pass in a hash with the
    # attributes and their values, user_params is a method (see below!)
    @spell = Spell.new(spell_params)
    
    if (@spell.bard == false && @spell.cleric == false && @spell.druid == false && @spell.paladin == false && @spell.ranger == false && @spell.sorcerer == false && @spell.warlock == false && @spell.wizard == false)
         flash[:notice] = 'Error: Need to have 1 or more classes.'  
    else
        if @spell.save
          redirect_to spells_url, notice: 'Spell was successfully created.'  
        else
          render :new
        end
    end
  end

  # PATCH/PUT /users/:id
  def update
    @spell = Spell.find(params[:id])  
    if @spell.update(spell_params)
       redirect_to spells_url, notice: 'Spell was successfully saved.'  
    else
      render :edit
    end
  end

  def confirm_delete
      @spell = Spell.find(params[:id])
      # show the form for confirm_delete of user 
  end
    
  # DELETE /users/:id
  def destroy
    @spell = Spell.find(params[:id])  
      
    if @spell.destroy
        redirect_to spells_url, notice: 'Spell was successfully saved.'  
    else
        flash[:notice] = 'Unable to delete spell.'
    end       
  end
    
  def add_to_book
     # @spell = Spell.find(params[:id]) 
      #@book = Book.all
  end

  def adding_to_book
      @spell = Spell.find(params[:id]) 
      #@book = Book.where(name: params[:book_id])
      book_id = Book.where(name: params[:book_id]).pluck(:id)
      @book = Book.find(book_id[0])
      @book.spells << @spell
      
      if @book.save
           redirect_to spells_url, notice: 'Spell was successfully saved to book.'  
      else
          flash[:notice] = 'Unable to add spell to book.'
      end
  end
    
  private
    # Only allow a trusted parameter "white list" through.
    def spell_params
      # params is a hashtable.  It should have in it a key of :user.
      # The value for the :user key is another hash.
      # If params does not contain the key :user, an exception is raised.  
      # Only the "user" hash is returned and only with the permitted key(s).
      # So we get back { :name => someName, :email => someEmail}
      #params.fetch(:spell, {})
      params.require(:spell).permit(:name, :level, :school, :bard, :cleric, :druid, :paladin, :sorcerer, :ranger, :warlock, :wizard, :concentration, :description)
    end
end