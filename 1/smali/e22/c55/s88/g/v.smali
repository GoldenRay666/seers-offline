.class Le22/c55/s88/g/v;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field final synthetic a:Le22/c55/s88/g/s;


# direct methods
.method constructor <init>(Le22/c55/s88/g/s;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/g/v;->a:Le22/c55/s88/g/s;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5

    const/4 v4, 0x1

    iget-object v0, p0, Le22/c55/s88/g/v;->a:Le22/c55/s88/g/s;

    invoke-static {v0}, Le22/c55/s88/g/s;->d(Le22/c55/s88/g/s;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/e/j;

    const/16 v1, 0xd

    iput-byte v1, v0, Le22/c55/s88/e/j;->e:B

    iget-object v0, p0, Le22/c55/s88/g/v;->a:Le22/c55/s88/g/s;

    invoke-static {v0}, Le22/c55/s88/g/s;->d(Le22/c55/s88/g/s;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/e/j;

    iget-boolean v0, v0, Le22/c55/s88/e/j;->j:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/v;->a:Le22/c55/s88/g/s;

    invoke-static {v0}, Le22/c55/s88/g/s;->c(Le22/c55/s88/g/s;)Landroid/app/Activity;

    move-result-object v1

    iget-object v0, p0, Le22/c55/s88/g/v;->a:Le22/c55/s88/g/s;

    invoke-static {v0}, Le22/c55/s88/g/s;->d(Le22/c55/s88/g/s;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/e/j;

    iget-object v0, v0, Le22/c55/s88/e/j;->i:Ljava/lang/String;

    invoke-static {v1, v0}, Le22/c55/s88/f/a;->e(Landroid/content/Context;Ljava/lang/String;)Z

    iget-object v0, p0, Le22/c55/s88/g/v;->a:Le22/c55/s88/g/s;

    invoke-static {v0}, Le22/c55/s88/g/s;->c(Le22/c55/s88/g/s;)Landroid/app/Activity;

    move-result-object v1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Le22/c55/s88/f/e;->af:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v0, p0, Le22/c55/s88/g/v;->a:Le22/c55/s88/g/s;

    invoke-static {v0}, Le22/c55/s88/g/s;->d(Le22/c55/s88/g/s;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/e/j;

    iget-object v0, v0, Le22/c55/s88/e/j;->g:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "..."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x5dc

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Le22/c55/s88/g/v;->a:Le22/c55/s88/g/s;

    invoke-static {v0}, Le22/c55/s88/g/s;->c(Le22/c55/s88/g/s;)Landroid/app/Activity;

    move-result-object v1

    iget-object v0, p0, Le22/c55/s88/g/v;->a:Le22/c55/s88/g/s;

    invoke-static {v0}, Le22/c55/s88/g/s;->d(Le22/c55/s88/g/s;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/e/j;

    iget v0, v0, Le22/c55/s88/e/j;->h:I

    invoke-static {v1, v0, v4}, Le22/c55/s88/f/a;->a(Landroid/content/Context;II)Z

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/g/v;->a:Le22/c55/s88/g/s;

    invoke-static {v1}, Le22/c55/s88/g/s;->c(Le22/c55/s88/g/s;)Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Le22/c55/s88/g/v;->a:Le22/c55/s88/g/s;

    invoke-static {v2}, Le22/c55/s88/g/s;->c(Le22/c55/s88/g/s;)Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Le22/c55/s88/VManager;->getMainChildService(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v1, Le22/c55/s88/f/e;->bI:Ljava/lang/String;

    const/16 v2, 0xc

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    sget-object v1, Le22/c55/s88/f/e;->bJ:Ljava/lang/String;

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/g/v;->a:Le22/c55/s88/g/s;

    invoke-static {v1}, Le22/c55/s88/g/s;->c(Le22/c55/s88/g/s;)Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    iget-object v1, p0, Le22/c55/s88/g/v;->a:Le22/c55/s88/g/s;

    new-instance v2, Le22/c55/s88/g/a;

    iget-object v0, p0, Le22/c55/s88/g/v;->a:Le22/c55/s88/g/s;

    invoke-static {v0}, Le22/c55/s88/g/s;->c(Le22/c55/s88/g/s;)Landroid/app/Activity;

    move-result-object v3

    iget-object v0, p0, Le22/c55/s88/g/v;->a:Le22/c55/s88/g/s;

    invoke-static {v0}, Le22/c55/s88/g/s;->d(Le22/c55/s88/g/s;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/e/j;

    invoke-direct {v2, v3, v0}, Le22/c55/s88/g/a;-><init>(Landroid/app/Activity;Le22/c55/s88/e/j;)V

    invoke-static {v1, v2}, Le22/c55/s88/g/s;->a(Le22/c55/s88/g/s;Le22/c55/s88/g/a;)Le22/c55/s88/g/a;

    iget-object v0, p0, Le22/c55/s88/g/v;->a:Le22/c55/s88/g/s;

    invoke-static {v0}, Le22/c55/s88/g/s;->e(Le22/c55/s88/g/s;)Le22/c55/s88/g/a;

    move-result-object v1

    iget-object v0, p0, Le22/c55/s88/g/v;->a:Le22/c55/s88/g/s;

    invoke-static {v0}, Le22/c55/s88/g/s;->c(Le22/c55/s88/g/s;)Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Le22/c55/s88/Vaa;

    iget-object v0, v0, Le22/c55/s88/Vaa;->b:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v1, v0}, Le22/c55/s88/g/a;->a(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v0, p0, Le22/c55/s88/g/v;->a:Le22/c55/s88/g/s;

    invoke-static {v0}, Le22/c55/s88/g/s;->e(Le22/c55/s88/g/s;)Le22/c55/s88/g/a;

    move-result-object v0

    invoke-virtual {v0, v4}, Le22/c55/s88/g/a;->a(I)V

    goto :goto_0
.end method
