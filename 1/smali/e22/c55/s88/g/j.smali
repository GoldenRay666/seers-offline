.class Le22/c55/s88/g/j;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field final synthetic a:Le22/c55/s88/g/g;


# direct methods
.method constructor <init>(Le22/c55/s88/g/g;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/g/j;->a:Le22/c55/s88/g/g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/g/j;->a:Le22/c55/s88/g/g;

    invoke-static {v0}, Le22/c55/s88/g/g;->a(Le22/c55/s88/g/g;)Le22/c55/s88/ui/ImageGallery;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/ImageGallery;->setVisibility(I)V

    iget-object v0, p0, Le22/c55/s88/g/j;->a:Le22/c55/s88/g/g;

    invoke-static {v0}, Le22/c55/s88/g/g;->a(Le22/c55/s88/g/g;)Le22/c55/s88/ui/ImageGallery;

    move-result-object v0

    invoke-virtual {v0, p3}, Le22/c55/s88/ui/ImageGallery;->setSelection(I)V

    const/4 v0, 0x1

    sput-boolean v0, Le22/c55/s88/g/g;->a:Z

    return-void
.end method
