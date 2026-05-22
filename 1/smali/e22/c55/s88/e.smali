.class Le22/c55/s88/e;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Le22/c55/s88/g/ac;

.field final synthetic b:Le22/c55/s88/Vaa;


# direct methods
.method constructor <init>(Le22/c55/s88/Vaa;Le22/c55/s88/g/ac;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/e;->b:Le22/c55/s88/Vaa;

    iput-object p2, p0, Le22/c55/s88/e;->a:Le22/c55/s88/g/ac;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Le22/c55/s88/e;->b:Le22/c55/s88/Vaa;

    invoke-static {v0}, Le22/c55/s88/Vaa;->g(Le22/c55/s88/Vaa;)Ljava/util/Stack;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/e;->b:Le22/c55/s88/Vaa;

    invoke-static {v0}, Le22/c55/s88/Vaa;->g(Le22/c55/s88/Vaa;)Ljava/util/Stack;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/g/ac;

    invoke-virtual {v0}, Le22/c55/s88/g/ac;->a()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->clearFocus()V

    invoke-virtual {v0}, Le22/c55/s88/g/ac;->a()Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/e;->b:Le22/c55/s88/Vaa;

    invoke-static {v1}, Le22/c55/s88/Vaa;->e(Le22/c55/s88/Vaa;)Landroid/view/animation/TranslateAnimation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_0
    iget-object v0, p0, Le22/c55/s88/e;->b:Le22/c55/s88/Vaa;

    invoke-static {v0}, Le22/c55/s88/Vaa;->g(Le22/c55/s88/Vaa;)Ljava/util/Stack;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/e;->a:Le22/c55/s88/g/ac;

    invoke-virtual {v0, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Le22/c55/s88/e;->b:Le22/c55/s88/Vaa;

    iget-object v1, p0, Le22/c55/s88/e;->a:Le22/c55/s88/g/ac;

    iput-object v1, v0, Le22/c55/s88/Vaa;->d:Le22/c55/s88/g/ac;

    iget-object v0, p0, Le22/c55/s88/e;->a:Le22/c55/s88/g/ac;

    iget-object v1, p0, Le22/c55/s88/e;->b:Le22/c55/s88/Vaa;

    invoke-static {v1}, Le22/c55/s88/Vaa;->h(Le22/c55/s88/Vaa;)Le22/c55/s88/ui/d;

    move-result-object v1

    invoke-virtual {v0, v1}, Le22/c55/s88/g/ac;->a(Le22/c55/s88/ui/d;)V

    iget-object v0, p0, Le22/c55/s88/e;->b:Le22/c55/s88/Vaa;

    invoke-static {v0}, Le22/c55/s88/Vaa;->h(Le22/c55/s88/Vaa;)Le22/c55/s88/ui/d;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/e;->a:Le22/c55/s88/g/ac;

    iget-object v2, p0, Le22/c55/s88/e;->b:Le22/c55/s88/Vaa;

    invoke-static {v2}, Le22/c55/s88/Vaa;->i(Le22/c55/s88/Vaa;)Le22/c55/s88/ui/n;

    move-result-object v2

    const/4 v3, 0x3

    invoke-virtual {v0, v1, v2, v3}, Le22/c55/s88/ui/d;->a(Le22/c55/s88/ui/a;Le22/c55/s88/ui/n;I)V

    iget-object v0, p0, Le22/c55/s88/e;->b:Le22/c55/s88/Vaa;

    iget-object v1, p0, Le22/c55/s88/e;->b:Le22/c55/s88/Vaa;

    invoke-static {v1}, Le22/c55/s88/Vaa;->h(Le22/c55/s88/Vaa;)Le22/c55/s88/ui/d;

    move-result-object v1

    invoke-virtual {v0, v1}, Le22/c55/s88/Vaa;->setContentView(Landroid/view/View;)V

    iget-object v0, p0, Le22/c55/s88/e;->a:Le22/c55/s88/g/ac;

    invoke-virtual {v0}, Le22/c55/s88/g/ac;->a()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    iget-object v0, p0, Le22/c55/s88/e;->b:Le22/c55/s88/Vaa;

    invoke-static {v0}, Le22/c55/s88/Vaa;->g(Le22/c55/s88/Vaa;)Ljava/util/Stack;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_1

    iget-object v0, p0, Le22/c55/s88/e;->a:Le22/c55/s88/g/ac;

    invoke-virtual {v0}, Le22/c55/s88/g/ac;->a()Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/e;->b:Le22/c55/s88/Vaa;

    invoke-static {v1}, Le22/c55/s88/Vaa;->f(Le22/c55/s88/Vaa;)Landroid/view/animation/TranslateAnimation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_1
    return-void
.end method
