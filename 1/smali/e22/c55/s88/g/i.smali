.class Le22/c55/s88/g/i;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field final synthetic a:Le22/c55/s88/g/g;


# direct methods
.method constructor <init>(Le22/c55/s88/g/g;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/g/i;->a:Le22/c55/s88/g/g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/g/i;->a:Le22/c55/s88/g/g;

    invoke-static {v0}, Le22/c55/s88/g/g;->a(Le22/c55/s88/g/g;)Le22/c55/s88/ui/ImageGallery;

    move-result-object v0

    invoke-virtual {v0}, Le22/c55/s88/ui/ImageGallery;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/i;->a:Le22/c55/s88/g/g;

    invoke-static {v0}, Le22/c55/s88/g/g;->a(Le22/c55/s88/g/g;)Le22/c55/s88/ui/ImageGallery;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/ImageGallery;->setVisibility(I)V

    iget-object v0, p0, Le22/c55/s88/g/i;->a:Le22/c55/s88/g/g;

    invoke-static {v0}, Le22/c55/s88/g/g;->b(Le22/c55/s88/g/g;)Le22/c55/s88/ui/ImageGallery;

    move-result-object v0

    invoke-virtual {v0, p3}, Le22/c55/s88/ui/ImageGallery;->setSelection(I)V

    const/4 v0, 0x0

    sput-boolean v0, Le22/c55/s88/g/g;->a:Z

    :cond_0
    return-void
.end method
