.class Le22/c55/s88/c;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field final synthetic a:Le22/c55/s88/Vaa;


# direct methods
.method constructor <init>(Le22/c55/s88/Vaa;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/c;->a:Le22/c55/s88/Vaa;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5

    invoke-virtual {p1}, Landroid/widget/AdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    invoke-interface {v0, p3}, Landroid/widget/Adapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/c/e;

    invoke-static {v0}, Le22/c55/s88/f/a;->a(Le22/c55/s88/c/e;)Le22/c55/s88/e/j;

    move-result-object v1

    iget-object v2, p0, Le22/c55/s88/c;->a:Le22/c55/s88/Vaa;

    new-instance v3, Le22/c55/s88/g/a;

    iget-object v4, p0, Le22/c55/s88/c;->a:Le22/c55/s88/Vaa;

    invoke-direct {v3, v4, v1}, Le22/c55/s88/g/a;-><init>(Landroid/app/Activity;Le22/c55/s88/e/j;)V

    invoke-static {v2, v3}, Le22/c55/s88/Vaa;->a(Le22/c55/s88/Vaa;Le22/c55/s88/g/a;)Le22/c55/s88/g/a;

    iget-object v1, p0, Le22/c55/s88/c;->a:Le22/c55/s88/Vaa;

    invoke-static {v1}, Le22/c55/s88/Vaa;->c(Le22/c55/s88/Vaa;)Le22/c55/s88/g/a;

    move-result-object v1

    iget-object v2, p0, Le22/c55/s88/c;->a:Le22/c55/s88/Vaa;

    iget-object v2, v2, Le22/c55/s88/Vaa;->b:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v1, v2}, Le22/c55/s88/g/a;->a(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v1, p0, Le22/c55/s88/c;->a:Le22/c55/s88/Vaa;

    iget-object v2, p0, Le22/c55/s88/c;->a:Le22/c55/s88/Vaa;

    invoke-static {v2}, Le22/c55/s88/Vaa;->c(Le22/c55/s88/Vaa;)Le22/c55/s88/g/a;

    move-result-object v2

    iget-object v2, v2, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    invoke-virtual {v1, v2}, Le22/c55/s88/Vaa;->a(Landroid/view/View;)V

    iget-object v1, p0, Le22/c55/s88/c;->a:Le22/c55/s88/Vaa;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v0, v0, Le22/c55/s88/c/e;->e:I

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Le22/c55/s88/f/a;->h(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method
