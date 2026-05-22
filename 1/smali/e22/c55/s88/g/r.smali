.class Le22/c55/s88/g/r;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# instance fields
.field final synthetic a:Le22/c55/s88/g/p;


# direct methods
.method constructor <init>(Le22/c55/s88/g/p;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/g/r;->a:Le22/c55/s88/g/p;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 2

    add-int v0, p2, p3

    add-int/lit8 v0, v0, -0x1

    iget-object v1, p0, Le22/c55/s88/g/r;->a:Le22/c55/s88/g/p;

    invoke-static {v1}, Le22/c55/s88/g/p;->a(Le22/c55/s88/g/p;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Le22/c55/s88/g/r;->a:Le22/c55/s88/g/p;

    invoke-static {v1}, Le22/c55/s88/g/p;->b(Le22/c55/s88/g/p;)I

    move-result v1

    if-eqz v1, :cond_0

    add-int/lit8 v1, p4, -0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/r;->a:Le22/c55/s88/g/p;

    invoke-static {v0}, Le22/c55/s88/g/p;->c(Le22/c55/s88/g/p;)Landroid/widget/TextView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Le22/c55/s88/g/r;->a:Le22/c55/s88/g/p;

    invoke-static {v0}, Le22/c55/s88/g/p;->d(Le22/c55/s88/g/p;)Le22/c55/s88/ui/n;

    move-result-object v0

    invoke-virtual {v0}, Le22/c55/s88/ui/n;->d()I

    move-result v0

    const/16 v1, 0x1f4

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/r;->a:Le22/c55/s88/g/p;

    invoke-virtual {v0}, Le22/c55/s88/g/p;->b()V

    :cond_0
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/r;->a:Le22/c55/s88/g/p;

    invoke-static {v0, p2}, Le22/c55/s88/g/p;->a(Le22/c55/s88/g/p;I)I

    return-void
.end method
