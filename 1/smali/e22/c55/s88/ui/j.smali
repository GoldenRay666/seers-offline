.class Le22/c55/s88/ui/j;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Le22/c55/s88/ui/i;


# direct methods
.method constructor <init>(Le22/c55/s88/ui/i;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/ui/j;->a:Le22/c55/s88/ui/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    const/4 v3, 0x1

    iget-object v0, p0, Le22/c55/s88/ui/j;->a:Le22/c55/s88/ui/i;

    invoke-static {v0}, Le22/c55/s88/ui/i;->a(Le22/c55/s88/ui/i;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/ui/j;->a:Le22/c55/s88/ui/i;

    invoke-static {v0}, Le22/c55/s88/ui/i;->c(Le22/c55/s88/ui/i;)Landroid/widget/ImageView;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/ui/j;->a:Le22/c55/s88/ui/i;

    invoke-static {v1}, Le22/c55/s88/ui/i;->b(Le22/c55/s88/ui/i;)Landroid/content/Context;

    move-result-object v1

    const/16 v2, 0xd

    invoke-static {v1, v2}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Le22/c55/s88/ui/j;->a:Le22/c55/s88/ui/i;

    invoke-static {v0}, Le22/c55/s88/ui/i;->d(Le22/c55/s88/ui/i;)Landroid/widget/TextView;

    move-result-object v0

    const/16 v1, 0x3e8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    iget-object v0, p0, Le22/c55/s88/ui/j;->a:Le22/c55/s88/ui/i;

    invoke-static {v0, v3}, Le22/c55/s88/ui/i;->a(Le22/c55/s88/ui/i;Z)Z

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Le22/c55/s88/ui/j;->a:Le22/c55/s88/ui/i;

    invoke-static {v0}, Le22/c55/s88/ui/i;->c(Le22/c55/s88/ui/i;)Landroid/widget/ImageView;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/ui/j;->a:Le22/c55/s88/ui/i;

    invoke-static {v1}, Le22/c55/s88/ui/i;->b(Le22/c55/s88/ui/i;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v3}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Le22/c55/s88/ui/j;->a:Le22/c55/s88/ui/i;

    invoke-static {v0}, Le22/c55/s88/ui/i;->d(Le22/c55/s88/ui/i;)Landroid/widget/TextView;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    iget-object v0, p0, Le22/c55/s88/ui/j;->a:Le22/c55/s88/ui/i;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Le22/c55/s88/ui/i;->a(Le22/c55/s88/ui/i;Z)Z

    goto :goto_0
.end method
