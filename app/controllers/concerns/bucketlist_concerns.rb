module BucketlistConcerns
  private

  def set_bucketlist
    @bucketlist = @current_user.bucketlists.find_by(id: params[:id])
    raise(
      ActiveRecord::RecordNotFound, Messages.not_found("bucketlist")
    ) unless @bucketlist
  end

  def user_bucketlists
    @bucketlists = @current_user.bucketlists
  end

  def set_bucketlist_item
    @item = item_bucketlist.items.find_by(id: params[:id]) if item_bucketlist
    raise(
      ActiveRecord::RecordNotFound, Messages.not_found("item")
    ) unless @item
  end

  def bucketlist_items
    @items = item_bucketlist.items if item_bucketlist
  end

  def item_bucketlist
    @current_user.bucketlists.find_by(id: params[:bucketlist_id])
  end
end