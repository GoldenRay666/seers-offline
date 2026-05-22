.class Le22/c55/s88/g/ah;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field final synthetic a:Le22/c55/s88/g/ac;


# direct methods
.method constructor <init>(Le22/c55/s88/g/ac;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/g/ah;->a:Le22/c55/s88/g/ac;

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

    new-instance v2, Le22/c55/s88/g/ac;

    iget-object v3, p0, Le22/c55/s88/g/ah;->a:Le22/c55/s88/g/ac;

    invoke-static {v3}, Le22/c55/s88/g/ac;->b(Le22/c55/s88/g/ac;)Landroid/app/Activity;

    move-result-object v3

    const/4 v4, 0x2

    invoke-direct {v2, v3, v1, v4}, Le22/c55/s88/g/ac;-><init>(Landroid/app/Activity;Le22/c55/s88/e/j;I)V

    iget-object v1, p0, Le22/c55/s88/g/ah;->a:Le22/c55/s88/g/ac;

    invoke-static {v1}, Le22/c55/s88/g/ac;->b(Le22/c55/s88/g/ac;)Landroid/app/Activity;

    move-result-object v1

    check-cast v1, Le22/c55/s88/Vaa;

    invoke-virtual {v1, v2}, Le22/c55/s88/Vaa;->a(Le22/c55/s88/g/ac;)V

    iget-object v1, p0, Le22/c55/s88/g/ah;->a:Le22/c55/s88/g/ac;

    invoke-static {v1}, Le22/c55/s88/g/ac;->b(Le22/c55/s88/g/ac;)Landroid/app/Activity;

    move-result-object v1

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
